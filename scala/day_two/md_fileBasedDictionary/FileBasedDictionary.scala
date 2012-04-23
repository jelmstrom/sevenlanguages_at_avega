import collection.mutable.HashMap
import io.Source

object FileBasedDictionary extends Application {

  val file = Source.fromFile("day_two/md_fileBasedDictionary/curseDictionary.txt").getLines()
  val censorDictionary = new HashMap[String, String]
  file.foreach(line => censorDictionary += line.split(" ")(0) -> line.split(" ")(1))
  censorDictionary.foreach(entry => println(entry))
}
