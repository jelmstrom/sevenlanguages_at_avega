import io.Source
import java.io.File

class UncensoredReader {

   val text =  Source.fromFile("je_scala.txt").mkString

    def read(): String= {
         text
    }

}



trait Censor extends UncensoredReader {

  val censoredWords = Map("I" -> "Our glorified leader", "Strings"->"information", "Internet" -> "Party Library")

  override def read(): String = {
    val censored = censorText(text.split(" ").iterator.toList)
    censored.foldLeft("")((result : String, item :String) => result + " " + item)
  }
  def censorText(words: scala.List[String]):List[String] = {
    words map (word => applyCensorship(word))
  }


  def applyCensorship(word : String): String = {
     val replacement: Iterable[String]= censoredWords filter (_._1 equalsIgnoreCase word) map(_._2)
     if (!replacement.isEmpty)   {
      return replacement.last
     }
     word
  }

}


println(new UncensoredReader().read())
println((new UncensoredReader with Censor).read())

