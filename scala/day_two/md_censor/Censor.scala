import collection.immutable.HashMap

trait Censor {
  val wordReplacements = HashMap("Shoot" -> "Pucky", "Darn" -> "Beans")

  def replaceWords(text: String): String = {
    val censoredText : String = wordReplacements.foldLeft(text)((text, replacement) => text.replace(replacement._1, replacement._2))
    censoredText
  }
}
