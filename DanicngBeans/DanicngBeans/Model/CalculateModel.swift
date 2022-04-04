//
//  CalculateModel.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/04/04.
//

import Foundation
import UIKit

class CalculateModel {
    
    static let shared = CalculateModel()
    
    private init() { }
    
    var accumlator: Int = 0
    
    var result: Int {
        get {
            return accumlator
        }
        set {
            accumlator += newValue
        }
    }
    
    func setDecimalWon(value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
        
        return result
    }
    
    func calculateAddedPrice(sender: UIStepper, menuPrice: Int) -> Int {
        let menuCount = Int(sender.value)
        
        let calculatedPrice = menuCount * menuPrice
        
        return calculatedPrice
    }
}
