val list = List("Just", "a", "list", "of","Strings")

val total = list.foldLeft(0)((size, item) => size + item.size)
println("Letter Count " + total)

val totalWords = list.foldLeft(0)((size, item) => size + 1)
println("Word Count " + totalWords)
