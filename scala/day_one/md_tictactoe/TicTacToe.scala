object TicTacToe extends Application {

  def assertResult(result: Result) = result match {
    case Xwins() => println("X is the winner")
    case Owins() => println("0 is the winner")
    case Draw() => println("Its a draw")
    case NotFinished() => println("Can't decide winner, not finished")
  }

//  val board = Board

//  var result: Result = board.evaluateWinner()
//  assertResult(result)
//  board.placeMarker(Xmarker(), Coordinate(1, 1))
//  board.placeMarker(Xmarker(), Coordinate(1, 2))
//  assertResult(board.evaluateWinner())
//  board.placeMarker(Xmarker(), Coordinate(1, 3))
//  assertResult(board.evaluateWinner())

  println("Game 2 xxxxxxxxxxxxxxxx")
  val board2 = Board

  board2.placeMarker(Xmarker(), Coordinate(1, 1))
  board2.placeMarker(Xmarker(), Coordinate(2, 2))

  board2.placeMarker(Xmarker(), Coordinate(3, 3))
  assertResult(board2.evaluateWinner())



}

abstract class Result()

case class Winner() extends Result

case class Xwins() extends Winner

case class Owins() extends Winner

case class Draw() extends Result

case class NotFinished() extends Result
