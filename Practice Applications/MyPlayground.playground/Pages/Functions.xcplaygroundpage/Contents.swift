//Function

import Foundation

func mySum(number1: Int, number2 : Int){
    let result = number1+number2
    print("The sum is \(result)")
}
mySum(number1:10,number2:20)

func mySum2(number1: Int, number2 : Int){
    return number1 + number2
    
}


print("The sum is \(mySum2(number1:10,number2:20))")
