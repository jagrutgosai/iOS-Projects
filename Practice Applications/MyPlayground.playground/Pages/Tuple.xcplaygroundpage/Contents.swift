//: Tuple

import Foundation

var myTuple : (firstName : String, lastName : String, age : Int)
myTuple = ( "Jagrut","Gosai",22)
print(myTuple)

print(myTuple.firstName)
print(myTuple.age)

func getStudentInfo(studentNumber : String) -> (firstName : String, lastName : String, age : Int)
{
    return("Jagrut","Gosai",22)
}

let StudentInfo = getStudentInfo(studentNumber :"12345")

print("\(StudentInfo.firstName), \(StudentInfo.lastName),\(StudentInfo.age)")
