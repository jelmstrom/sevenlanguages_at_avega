
class MyAddress (var streetName: String
                 , var city: String
                 , var postCode : String) {
  def print() = println("Address : " + streetName + ", " + city)
}

trait UsValidation extends MyAddress {
   def isValid() = postCode == "90210"

}

trait UkValidation extends MyAddress {
  def isValid() = postCode.contains(' ')
}


val okAddress = new MyAddress("home", "home", "90210") with UsValidation
val badAddress = new MyAddress("away", "away", "90210") with UkValidation

println(okAddress.isValid())
println(badAddress.isValid())