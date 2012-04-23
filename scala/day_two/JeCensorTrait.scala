

class UncensoredReader {

    def readText(): List[String]= {
        List("I", "read", "lots" , "of", "Strings", "from", "the", "Internet")
    }



}



trait Censor extends UncensoredReader {

  var censoredWords = Map("I" -> "Our glorified leader", "Strings"->"information", "Internet" -> "Party Library")

  override def readText(): List[String] = {
    super.readText map (word => applyCensorship(word))
  }

  def applyCensorship(word : String): String = {
     val replacement: Iterable[String]= censoredWords filter (_._1 equals word) map(_._2)
     if (!replacement.isEmpty)   {
      return replacement.last
     }
     word
  }

}


println(new UncensoredReader().readText())
println((new UncensoredReader with Censor).readText())
