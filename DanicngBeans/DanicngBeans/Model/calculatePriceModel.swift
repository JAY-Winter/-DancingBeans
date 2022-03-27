//
//  calculatePriceModel.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/15.
//

import Foundation
import UIKit

class CalculateModel {
    
    private var price = 0
    
    var result: Int {
        get {
            return price
        }
    }
   
    func setPrice(sender: UIStepper, menuPrice: Int) -> Int {
        let menuCount = Int(sender.value)
        
        price = menuCount*menuPrice
        
        var result: Int {
            get {
                return menuPrice
            }
            set{
                
            }
        }
        
        
        return price
    }
  }
