//
//  Calculator.swift
//  CountOnMe
//
//  Created by user214073 on 13/02/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation
protocol Calculator {
    func calculate()
}
class CalculatorBasic: Calculator{
    var chaine : String
    init(chaine:String){
        self.chaine = chaine
    }
    func calculate() {
        <#code#>
    }
}
