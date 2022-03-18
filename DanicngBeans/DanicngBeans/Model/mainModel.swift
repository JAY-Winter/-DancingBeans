//
//  mainModel.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/22.
//

import Foundation
import UIKit

class MainModel {
    static let shared = MainModel()
    
    var menuInfoInstance = menuInfo()
    
    var menuList : Dictionary<String, Drink> =
    [
        "Americano" : .Espresso(price: 3500, shot: 2),
        "Latte" : .Espresso(price: 4000, shot: 2),
        "Dancing Latte" : .Espresso(price: 5000, shot: 2),
        "Vanilla Latte" : .Espresso(price: 4500, shot: 2),
        "Ein Spanner" : .Espresso(price: 5000, shot: 4),
        "Black Tea" : .Tea(price: 7000)
    ]
    
    enum Drink {
        case Espresso(price: Int, shot: Int)
        case Tea(price: Int)
    }
    
    struct menuInfo {
        var menuName: String!
        var menuPrice: Int!
        var menuShot: Int?
    }
    
    func setCommonMenuInfo(menuName: String) {
        if let menu = menuList[menuName] {
            switch menu {
            case .Espresso(let price, let shot) :
                menuInfoInstance.menuName = menuName
                menuInfoInstance.menuPrice = price
                menuInfoInstance.menuShot = shot
                
            case .Tea(let price) :
                menuInfoInstance.menuName = menuName
                menuInfoInstance.menuPrice = price
            }
        }
    }
    
    private init() { }
    
    deinit {
        print("deinit 으로 메모리 해제")
    }
}
