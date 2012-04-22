package md_foldleft

object SizeOfStringList extends Application {
  val list = List("a", "b", "c")
  list.foldLeft(0)((sum, value) => sum + 1)
}
