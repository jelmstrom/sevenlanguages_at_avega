import scala.io._
import scala.actors._
import Actor._
import util.matching.Regex.MatchIterator

// START:loader
object PageLoader {
  def getPageSize(url : String) = Source.fromURL(url).mkString.length
  def getNumberOfPageLinks(url : String): Int = {
    //(href=")\.*
    // href="http://www.arla.se"
    // href="/relative/path.html" och lite till
    val reg = """href=""".r
    val foundMatches : MatchIterator = reg.findAllIn(Source.fromURL(url).mkString)
    foundMatches.size
  }
  def getListOfLinks(url : String): List[String] = {
    // href="http://www.arla.se"
    // href="/relative/path.html" och lite till href="http://my.com"
    val reg = """href=\s*\"(\S+)""".r
    val pageText = Source.fromURL(url).mkString
    println(pageText)
    val foundHrefs : MatchIterator = reg.findAllIn(pageText)
    // length !!!!!
    println("Found: " + foundHrefs.hasNext)
    var listOfHrefs : List[String] = Nil

    while (foundHrefs.hasNext) {
      listOfHrefs = listOfHrefs ::: List(foundHrefs.next())
    }
    println("List: " + listOfHrefs.length)
    listOfHrefs.map(href => href.split("href=\"")(1)).map(remaining => remaining.substring(0, remaining.length - 1))
  }
}
// END:loader

val urls = List("http://www.amazon.com/",
  "http://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/" )

// START:time
def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds.")
}
// END:time

// START:sequential
def getPageSizeSequentially() = {
  for(url <- urls) {
    println("Size for " + url + ": " + PageLoader.getPageSize(url))
  }
}
// END:sequential

// START:concurrent
def getPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getPageSize(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, size) =>
        println("Size for " + url + ": " + size)
    }
  }
}

// START:concurrent
def getTotalPageSizeConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getListOfLinks(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, linkUrls) =>
        //linkUrls.foreach(linkUrl => println("Size for " + linkUrl + ": " + size))
    }
  }
}

// START:concurrent
def getNumberOfLinksInPage() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getNumberOfPageLinks(url)) }
  }

  for(i <- 1 to urls.size) {
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
//getNumberOfLinksInPage()
PageLoader.getListOfLinks("http://www.amazon.com").foreach(url => println(url))
//timeMethod { getPageSizeConcurrently }
// END:script