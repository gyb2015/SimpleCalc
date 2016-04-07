//
//  main.swift
//  SimpleCalc
//
//  Created by User on 4/5/16.
//  Copyright © 2016 User. All rights reserved.
//

import Foundation

//Input reading
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

//Convert incoming string to Integer
func convertToDouble(incoming:String) -> Double {
    return (incoming as NSString).doubleValue
}

let firstNum = input()
var userInput = false

//put evenything to an array, and split by space
var inputArr = firstNum.characters.split{$0 == " "}.map(String.init)

func simpleOp (operation: String, firstNum: String, secoundNum: String){
    //+, -, *, /, %
    switch operation{
    case "+" : print(convertToDouble(firstNum) + convertToDouble(secoundNum))
    case "-" : print(convertToDouble(firstNum) - convertToDouble(secoundNum))
    case "*" : print(convertToDouble(firstNum) * convertToDouble(secoundNum))
    case "/" : print(convertToDouble(firstNum) / convertToDouble(secoundNum))
    case "%" : print(convertToDouble(firstNum) % convertToDouble(secoundNum))
    default: print("Invaild operator input :\(operation)")
        break
    }
}

func extendedOp(){
    //count, avg, fact
    let extendedOp = inputArr.popLast()!
    
    switch extendedOp{
    case "count" : print(inputArr.count)
        break
    case "avg" : print(avg())
        break
    case "fact" : print(fact(convertToDouble(inputArr[0])))
    default: print("Invaild operator input :\(extendedOp)")
        break
    }
}

func avg()->String{
    var total: Double = 0
    for i in 0 ..< inputArr.count {
        total +=  convertToDouble(inputArr[i])
    }

    return String(total/Double(inputArr.count))
}

func fact(number : Double)->Double{
    if (number == 0){
        return 1
    } else {
        return number * fact(number-1)
    }
}

if inputArr.count > 1{
    userInput = false
    extendedOp()
    
}else{
    userInput = true
    var operation = input()
    let secondNum = input()
    simpleOp(operation , firstNum: firstNum , secoundNum: secondNum )
}
