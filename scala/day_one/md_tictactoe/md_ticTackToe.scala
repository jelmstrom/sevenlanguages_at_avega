import collection.immutable.HashMap

case class Coordinate(row: Int, col: Int)

abstract case class Marker(mark: String)

case class Xmarker() extends Marker(mark = "X")

case class Omarker() extends Marker(mark = "O")

object Board {
  val row1 = List(Coordinate(1, 1), Coordinate(1, 2), Coordinate(1, 3))
  val row2 = List(Coordinate(1, 1), Coordinate(1, 2), Coordinate(1, 3))
  val row3 = List(Coordinate(1, 1), Coordinate(1, 2), Coordinate(1, 3))
  val col1 = List(Coordinate(1, 1), Coordinate(2, 1), Coordinate(3, 1))
  val col2 = List(Coordinate(1, 2), Coordinate(2, 2), Coordinate(3, 2))
  val col3 = List(Coordinate(1, 3), Coordinate(2, 3), Coordinate(3, 3))
  val cross1 = List(Coordinate(1, 1), Coordinate(2, 2), Coordinate(3, 3))
  val cross2 = List(Coordinate(1, 3), Coordinate(2, 2), Coordinate(3, 1))
  val possibleSolutions = List(row1, row2, row3, col1, col2, col3, cross1, cross2)
  var placedMarkers = new HashMap[Coordinate, Marker]

  def placeMarker(marker: Marker, position: Coordinate) {
    placedMarkers += position -> marker
    println("Placed marker: " + placedMarkers(position))
  }

  def evaluateWinner(): Result = {
    var result: Result = null
    possibleSolutions.foreach {
      possibleSolution => 
        result = evaluatePossibleWinner(possibleSolution)
        result match {
          case Winner() => {
            println("Winner detected")
            return result
          }
          case _ => println("No winner yet, continue")
        }
    }
    result
  }

  def evaluatePossibleWinner(possibleWinner: List[Coordinate]): Result = {
    var numberOfXInRow = 0
    var numberOfOInRow = 0
    var numberOfEmptyInRow = 0
    possibleWinner.foreach {
      position: Coordinate =>
        var marker: Marker = null
        if (placedMarkers.contains(position)) {
          marker = placedMarkers(position)
        }
        marker match {
          case Xmarker() => numberOfXInRow += 1
          case Omarker() => numberOfOInRow += 1
          case null => numberOfEmptyInRow += 1
        }

    }
    println("Number of x in solution: " + numberOfXInRow)
    println("Number of o in solution: " + numberOfOInRow)
    println("Number of empty  solution: " + numberOfEmptyInRow)
    var res: Result = new NotFinished
    if (numberOfXInRow == 3) {
      res = new Xwins
    } else if (numberOfOInRow == 3) {
      res = new Owins
    }
    res
  }

}