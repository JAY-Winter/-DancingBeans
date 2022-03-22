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
        "Ein Spanner" : .Special(price: 6000, shot: 2, temp: "OnlyIce"),
        "Black Tea" : .Tea(price: 7000)
    ]
    
    enum Drink {
        case Espresso(price: Int, shot: Int)
        case Tea(price: Int)
        case Special(price: Int, shot: Int, temp: String)
    }
    
    struct menuInfo {
        var menuName: String!
        var menuPrice: Int!
        var menuShot: Int?
        var getWay: String!
        var temp: String!
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
//                menuInfoInstance.menuShot = nil
                // Espresso menu 들어갔다가 나오면 struct menuInfo.menuShot 에 Espresso shot 이 남아있어서 Tea menu 들어갈 시 nil 로 초기화
                
            case .Special(let price, let shot, let temp) :
                menuInfoInstance.menuName = menuName
                menuInfoInstance.menuPrice = price
                menuInfoInstance.menuShot = shot
                menuInfoInstance.temp = temp
            }
        }
    }
    
    private init() {
//        print("mainModel Instance Init")
    }
    
    deinit {
        print("mainModel Instance Deinit")
    }
    
}
