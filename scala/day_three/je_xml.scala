

val movies =
<movies>
  <movie genre="action">Pirates of the Caribbean</movie>
  <movie genre="action">Pirates of the Caribbean 2</movie>
  <movie genre="fairytale">Edward Scissorhands</movie>
</movies>


println((movies \ "movie")(0) \ "@genre")

val nodes = movies \ "movie"

nodes foreach(node => println((node \ "@genre").text.equals("action")))

println("Use filter method on nodes to look for genre")
println(nodes.filter(node => node \ "@genre" exists(_.text == "action")))

println("")
println("Same but different")
println((movies \\ "movie" filter { _ \ "@genre" exists (_.text == "action") }))

println("")



println("Filter with matcher")
movies \ "_"  foreach {movie =>
              movie match {
              case value @ <movie>{_*}</movie> if (value \ "@genre").text.equals("fairytale")=> println(value.text + " is a " + (value \ "@genre").text)
              case _ =>
             }
          }
