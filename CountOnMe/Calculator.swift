//
//  Calculator.swift
//  CountOnMe
//
//  Created by user214073 on 13/02/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation
protocol Calculator {
    func calculate() -> [String]
}


class CalculatorBasic: Calculator{
    
    var expression : [String]
    init(expression: [String]){
        self.expression = expression
    }
    
    static func formatExpression(expression: String) -> String {

        let signs = ["+ ,", "- ,", "x ,", "/ ,", ", +", ", -", ", x", ", /"]
        let formatted = ["+ 0,", "- 0,", "x 0,", "/ 0,", ",0 +", ",0 -", ",0 x", ",0 /"]
        var result = expression
        for i in 0...signs.count - 1{
            result = result.replacingOccurrences(of: signs[i], with: formatted[i])
        }
        return result.replacingOccurrences(of: ",", with: ".")
    }
    
    func isExpressionValid() -> Bool{
        if self.expression.count < 3 {
            return false
        }

        let signs = ["+", "-", "x", "/"]
        for sign in signs {
          if self.expression.last == sign {
            return false
          }
        }
        return true
    }
        
    func treatMultiplyAndDivide(){
        var i=0
            while( i  < self.expression.count){
                if(self.expression.count <= i+2){
                    break
                }
                
                let left = Double(self.expression[i])!
                let operand = self.expression[i+1]
                let right = Double(self.expression[i+2])!

                var result: Double
                if operand == "x" || operand == "/" {
                    result = ( operand == "x" ) ? left * right : left / right
                    self.expression.remove(at:i+2)
                    self.expression.remove(at:i+1)
                    self.expression.remove(at:i)
                    self.expression.insert("\(result)", at: i)
                    if(self.expression.count <= 1){
                        break
                    }

                }
                else{
                    i=i+2
                }

            }
    }
    
    func treatAdditionAndMinus(){
        while self.expression.count > 1{
                let left = Double(self.expression[0])!
                let operand = self.expression[1]
                let right = Double(self.expression[2])!

                let result: Double
                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                default: fatalError("Unknown operator !")
                }

                self.expression = Array(self.expression.dropFirst(3))
                self.expression.insert("\(result)", at: 0)
        }
    }
    
    
    
    
    func calculate() -> [String] {
        
        self.treatMultiplyAndDivide()
        self.treatAdditionAndMinus()
        return self.expression
    }
    
    
    
}

