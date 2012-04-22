
object CurseCensor extends Application with Censor {

  val textWithCurse = "Shoot and Darn now I am made Shoot again"
  val textWithoutCurse = replaceWords(textWithCurse)
  println(textWithoutCurse)

}
