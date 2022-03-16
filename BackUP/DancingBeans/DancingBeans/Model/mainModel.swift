//
//  mainModel.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/22.
//

import Foundation
import UIKit

class MainModel {
    
    var menuList : Dictionary<String, Drink> =
    [
        "Americano" : Drink.Espresso(price: 3500, shot: 2),
        "Latte" : Drink.Espresso(price: 4000, shot: 2),
        "Vanilla Latte" : Drink.Espresso(price: 4500, shot: 2),
        "Ein Spanner" : Drink.Espresso(price: 5000, shot: 4),
        "Test Tea" : Drink.Tea(price: 7000)
    ]
    
    enum Drink {
        
        case Espresso(price: Int, shot: Int)
        case Tea(price: Int)
        
    }
    
    struct MenuInfo {
        
        var menuPrice: Int
        var menuShot: Int?
        
    }
    
    
    var menuInfo: MenuInfo?
    
    
    func setCommonMenuInfo(menuName: String) {
        
        if let menu = menuList[menuName] {
            
            switch menu {
                
            case .Espresso(let price, let shot) :
                menuInfo = MenuInfo(menuPrice: price, menuShot: shot)
                
                
            case .Tea(let price) :
                break
                
            }
            
        }
        
    }
    
}
