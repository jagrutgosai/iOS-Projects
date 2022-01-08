// SET

import Foundation

var listOfCourse = Set<String>()
listOfCourse.insert("IOS")
listOfCourse.insert("PHP")
listOfCourse.insert("JAVA")
listOfCourse.insert("C#")
listOfCourse.insert("Python")
print(listOfCourse)

// contains
if listOfCourse.contains("Android")
{
    print("Android is there!")
} else{
    listOfCourse.insert("Android")
    print("Android inserted")
}
print(listOfCourse)
listOfCourse.remove("JAVA")
print(listOfCourse)


for course in listOfCourse{
    print(course)
}
for(index,course) in listOfCourse.enumerated(){
    print("The course #\(index) is \(course)")
}
