//
//  Calculator.swift
//  CountOnMe
//
//  Created by user214073 on 13/02/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation
protocol Calculator {
    func calculate() -> String
}


class CalculatorBasic: Calculator{
    var expression : String
    init(expression:String){
        self.expression = expression
    }
    func calculate() -> String {
        return "Yes mety"
    }
}
