import scala.io._
import scala.actors._
import Actor._
import util.matching.Regex.MatchIterator

// START:loader
object PageLoader {

  // b1 href="http://www.google.se/imghp?hl=sv&tab=wi">Bilder</a> <a class=gb1 href="http:/
  // href="http://www.arla.se" bla bla href="http://www.amazon.com/access"> and som
  // href="/relative/path.html" och lite till href="http://my.com"
  // <link rel="stylesheet" type="text/css" href="http://z-ecx.images-amazon.com/images/G/01/nav2/gamma/accessoriesCSS/US/combined-3689044428._V189697042_.css" /><script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/nav2/gamma/tmmJS/tmmJS-combined-core-65345._V1_.js" />   <script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/twister/beta/twister-dpf.cc9fb73adcb35a017570bfa9a4964009._V1_.js"/>  <script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/nav2/gamma/cmuAnnotations/cmuAnnotations-cmuAnnotations-49800._V1_.js" />  <script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/nav2/gamma/accessoriesJS/accessoriesJS-accessories-49340._V1_.js" />  <script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/nav2/gamma/lazyLoadLib/lazyLoadLib-lazyLoadLib-1454._V1_.js" />  <script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/nav2/gamma/priceformatterJQ/priceformatterJQ-price-21701._V1_.js" />  <script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/x-locale/communities/profile/customer-popover/script-13-min._V224617671_.js" />  <script type="text/javascript" src="http://z-ecx.images-amazon.com/images/G/01/x-locale/personalization/yourstore/js/ratings-bar-366177._V204593665_.js" />');
  val HREF_REGEXP = """href=\s*\"(\S+)\"""".r

  def getPageSize(url: String) = Source.fromURL(url).mkString.length

  def getNumberOfPageLinks(url: String): Int = {
    val foundMatches: MatchIterator = HREF_REGEXP.findAllIn(Source.fromURL(url).mkString)
    foundMatches.size
  }

  private def extractUrlsFromHrefs(listOfHrefs : List[String]): List[String] = {
    println("List: " + listOfHrefs.length)
    listOfHrefs.map(href => href.split("href=\"")(1)).map(remaining => remaining.substring(0, remaining.length - 1))
  }

  def getListOfLinks(url: String): List[String] = {
    val pageText = Source.fromURL(url).mkString
    println(pageText)
    val foundHrefs: MatchIterator = HREF_REGEXP.findAllIn(pageText)
    extractUrlsFromHrefs(foundHrefs.toList)
  }
}

// END:loader

//val urls = List("http://www.amazon.com/",
//  "http://www.twitter.com/",
//  "http://www.google.com/",
//  "http://www.cnn.com/" )

val urls = List("http://www.google.com/")

// START:time
def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getPageSizeSequentially() = {
  for (url <- urls) {
    println("Size for " + url + ": " + PageLoader.getPageSize(url))
  }
}
// END:sequential

// START:concurrent
def getPageSizeConcurrently() = {
  val caller = self

  for (url <- urls) {
    actor {
      caller !(url, PageLoader.getPageSize(url))
    }
  }

  for (i <- 1 to urls.size) {
    receive {
      case (url, size) =>
        println("Size for " + url + ": " + size)
    }
  }
}

// START:concurrent
def getTotalPageSizeConcurrently() = {
  val caller = self

  for (url <- urls) {
    actor {
      caller !(url, PageLoader.getListOfLinks(url))
    }
  }

  for (i <- 1 to urls.size) {
    receive {
      case (url, linkUrls: List[String]) =>
        val filteredUrls = linkUrls.filter(link => link.startsWith("http"))
        println("Recieved: " + filteredUrls)
        filteredUrls.foreach {
          linkUrl =>
            println("Starting new Actor")
            actor {
              caller !(linkUrl, PageLoader.getPageSize(linkUrl))
            }
        }
        for (j <- 1 to linkUrls.size) {
          receive {
            case (url, size) =>
              println("Size for " + url + ": " + size)
          }
        }
    }
  }
}

// START:concurrent
def getNumberOfLinksInPage() = {
  val caller = self

  for (url <- urls) {
    actor {
      caller !(url, PageLoader.getNumberOfPageLinks(url))
    }
  }

  for (i <- 1 to urls.size) {
    receive {
      case (url, size) =>
        println("Number of links for " + url + ": " + size)
    }
  }
}
// END:concurrent

// START:script
//PageLoader.getPageLink("http://www.amazon.com")
println("Sequential run:")
//timeMethod { getPageSizeSequentially }

println("Concurrent run")
getTotalPageSizeConcurrently()
//PageLoader.getListOfLinks("http://www.amazon.com").foreach(url => println(url))
//timeMethod { getPageSizeConcurrently }
// END:script