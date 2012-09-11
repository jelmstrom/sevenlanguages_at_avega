import java.io.IOException
import scala._
import scala.actors.Actor._
import scala.collection.immutable.Range.Int
import scala.io._
import scala.actors._

// START:loader
object PageLoader {
  // If you get "MalformedInputException: Input length = 1" then you can change to fromURL(url, Codec.ISO8859.name())
  def getPageSize(content : String) = content.length
  def getPageSource(url : String): String=  {
         try {
          return Source.fromURL(url, Codec.ISO8859.name()).mkString
         } catch {
           case _ => //println("gobble")
        }
      ""
  }
}

// START:loader
class PageLoader2 (var url: String) extends Actor {

  def act() {
    val caller = self
    val pageSource = PageLoader.getPageSource(url)
    val linkReg = """http://.*?(\w.*?).*?[\"']""".r
    val links = linkReg.findAllIn(pageSource).toList
    val filtered =  links filter (link => link.startsWith("http"))
    filtered foreach  {
        url  =>
          actor { caller ! (url, PageLoader.getPageSize(PageLoader.getPageSource(url.substring(0,url.size-1)))) }
    }
    var accumulatedSize = 0
    for(i <- 1 to filtered.size) {
      receive {
        case (url, size: Int) =>
          accumulatedSize = accumulatedSize+size
      }
    }


    println("Size for " + url + ": " + PageLoader.getPageSize(pageSource) + " With " + filtered.size +" links")
    println("accumulated size = " + (accumulatedSize + PageLoader.getPageSize(pageSource)) + "(" + filtered.size+")")

  }
}
// END:loader

val urls = List("http://www.amazon.com/",
  "http://www.twitter.com/",
 // "http://www.google.com/",
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
// END:concurrent

// START:script
//println("Sequential run:")
//timeMethod { getPageSizeSequentially }

//println("Concurrent run")
//timeMethod { getPageSizeConcurrently }
// END:script


val start = System.nanoTime

var actor1 = new PageLoader2(urls(0)).start
var actor2 = new PageLoader2(urls(1)).start
var actor3 = new PageLoader2(urls(2)).start
//var actor4 = new PageLoader2(urls(3)).start


val end = System.nanoTime
println("Method took " + (end - start)/1000000000.0 + " seconds.")

/*
  href="http://edition.cnn.com/SPORT/2012/olympics/?hpt=hp_htp"
href="/SPECIALS/?hpt=hp_htp"
href="/">Home</a> | <a href="
href="/WORLD/"
href="/US/"
href="/AFRICA/"
href="/ASIA/"
href="/EUROPE/"
href="/LATINAMERICA/"
href="/MIDDLEEAST/"
href="/BUSINESS/"
href="/SPORT/"
href="/SHOWBIZ/"
href="/TECH/"
href="/TRAVEL/"
href="http://www.ireport.com/?cnn=yes"
href="/tools/index.html"
href="/services/rss/"
href="/services/podcasting/"
href="/exchange/blogs/index.html"
href="http://edition.cnn.com/mobile/"
href="/profile/"
href="/profile/"
href="/audio/radio/winmedia.html"
href="http://www.turnerstoreonline.com/"
href="/sitemap/"
href="http://partners.cnn.com/"
href="/espanol/"
href="http://www.cnnchile.com"
href="http://www.cnnmexico.com"
href="http://arabic.cnn.com/"
href="http://cnn.joins.com/"
href="http://www.cnn.co.jp/"
href="http://www.cnnturk.com/"
href="http://www.turner.com/"
href="/interactive_legal.html"
href="/privacy.html"
href="/services/ad.choices/"
href="http://www.cnnmediainfo.com/"
href="/intlsyndication/"
href="/about/"
href="/feedback/"
href="http://www.turner.com/careers/"
href="/help/"
href="/CNNI/"
href="/HLN/"
href="http://transcripts.cnn.com/TRANSCRIPTS/"
*/