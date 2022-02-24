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
        "Dancing Latte" : Drink.Espresso(price: 5000, shot: 2),
        "Vanilla Latte" : Drink.Espresso(price: 4500, shot: 2),
        "Ein Spanner" : Drink.Espresso(price: 5000, shot: 4),
        "Black Tea" : Drink.Tea(price: 7000)
    ]
    
    enum Drink {
        
        case Espresso(price: Int, shot: Int)
        case Tea(price: Int)
        
    }
    
    var menuInfo : Dictionary<String, Int?> = [
        "menuPrice" : 0,
        "menuShot" : 3
    ]
    
    class MenuInfo {
        
        var menuPrice: Int = 0
        var menuShot: Int?
        
    }
    
    var menuInfoInstance = MenuInfo()
    
    func setCommonMenuInfo(menuName: String) {
        
        if let menu = menuList[menuName] {
            
            switch menu {
                
            case .Espresso(let price, let shot) :
                //                menuInfo = MenuInfo(menuPrice: price, menuShot: shot)
                // Americano 일 때, let price : 3500, let shot : 2 이다
                // 이 값을 어떻게 MenuListViewController 로 보내줄 수 있을까?
                
                menuInfoInstance.menuPrice = price
                menuInfoInstance.menuShot = shot
                
            case .Tea(let price) :
                menuInfoInstance.menuPrice = price
                
            }
            
        }
        
    }
    
}
