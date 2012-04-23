import collection.mutable.{MutableList, LinkedList}
import scala._
import scala.Predef._

//Map((1,1)->"X",(1, 2)->"X") filter(_._2 == "X") map(_._1._2)

def tokens = List("X", "O")
var board =  MutableList.fill(9)(" ")
var i = 0
var pos = 0
while(!gameOver(board)) {
    println("Place : " + tokens(i%2))
    var valid = false
    while(!valid) {
      print("X:")
      val x = readLine().toInt
      print("Y:")
      val y = readLine().toInt
      pos = 3 * x + y
      valid = board(pos) == " "
    }
    board(pos) = tokens(i%2)
    prettyPrint(board)
    i +=1
 }

def gameOver(board: MutableList[String]) : Boolean = {
  boardFull(board) || horizontalWin(board)  || diagonalWin(board) || verticalWin(board)
}

def verticalWin(board: MutableList[String]): Boolean = {
  var h1= MutableList(board(0), board(3), board(6))   // board(i%3==0)
  var h2 = MutableList(board(1), board(4), board(7))  // board(i%3==1)
  var h3 = MutableList(board(2), board(5), board(8))  // board(i%3==2)
  sameMarkers(h1) || sameMarkers(h2)|| sameMarkers(h3)

}

def diagonalWin(board: MutableList[String]): Boolean = {
 var diagOne = MutableList(board(0), board(4), board(8))
 var diagTwo = MutableList(board(2), board(4), board(6))
 sameMarkers(diagOne) || sameMarkers(diagTwo)

}

def boardFull(board : MutableList[String]) : Boolean = {
  (board.filter(x => x == " ") size) == 0

}
def sameMarkers(row: MutableList[String]): Boolean = {
  row.distinct.size == 1 && !row.contains(" ")
}
def horizontalWin(board: MutableList[String]) : Boolean = {
  var rows = board grouped(3)

  rows foreach {
    row =>
      if(sameMarkers(row)){
        return true
      }
  }
  false
}

def prettyPrint(board: MutableList[String]) {
  var rows = board grouped(3)
  println(" Y 0 1 2")
  println("X  _____")
  var i = 0;
  rows foreach {
    row =>
      print("" + i + " |")
      row foreach {
      slot =>
      print(slot + " ")
    }
      println("")
      i +=1
  }
}





