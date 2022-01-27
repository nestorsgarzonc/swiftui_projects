import UIKit

var greeting = "Hello, playground"

print(greeting)

func doSomething(a:Int, b:Int)->Int{
    let res=a+b;
    print("The result is \(res)")
    return res
}


let res=doSomething(a:10, b:20)
print(res)


struct calculator{
    var number1:Int
    var number2:Int
    
    func sum() -> Int {
        return number1+number2
    }
    
    func multiplication() -> Int {
        return number1*number2
    }
    
    func divicion() -> Int {
        return number1/number2
    }
    
    func resta() -> Int {
        return number1-number2
    }
}

var myCalc=calculator(number1:1,number2:2)
print(
    myCalc.sum()
)
