//
//  mainModel.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/22.


import Foundation
import UIKit

class MainModel {
    
    static let shared = MainModel()
    
    var menuInfoInstance = menuInfo()
    
    var menuList : Dictionary<String, Drink> =
    [
        "Americano" : .Espresso(price: 3500, shot: 2, syrup: 0),
        "Latte" : .Espresso(price: 4000, shot: 2, syrup: 0),
        "Dancing Latte" : .Espresso(price: 5000, shot: 2, syrup: 0),
        "Vanilla Latte" : .Espresso(price: 4500, shot: 2, syrup: 2),
        "Ein Spanner" : .Signature(price: 6000, shot: 2, temp: "OnlyIce", getWay: "매장 전용"),
        "Black Tea" : .Tea(price: 7000)
    ]
    
    var addedMenuList: [menuInfo] = [menuInfo]()
    
    var errorMessage: String = ""
    
    var accumlator: Int = 0
        
    var result: Int {
        get {
            return accumlator
        }
        set {
            accumlator += newValue
        }
    }
    
   // MARK: - User actions
    enum Drink {
        case Espresso(price: Int, shot: Int, syrup: Int?)
        case NonEspresso(price: Int, temp: String)
        case Tea(price: Int)
        case Signature(price: Int, shot: Int, temp: String, getWay: String)
    }
    
    // MARK: - User actions
    struct menuInfo {
        var name: String!
        var price: Int!
        var shot: Int?
        var syrup: Int?
        var getWay: String!
        var temp: String?
    }
    
    // MARK: - User actions
    
    func initMenuInfoInstance() {
        menuInfoInstance.name = nil
        menuInfoInstance.price = nil
        menuInfoInstance.shot = nil
        menuInfoInstance.syrup = nil
        menuInfoInstance.getWay = nil
        menuInfoInstance.temp = nil
    }
    
    func setCommonMenuInfo(menuName: String) {
        if let menu = menuList[menuName] {
            switch menu {
            case .Espresso(let price, let shot, let syrup) :
                menuInfoInstance.name = menuName
                menuInfoInstance.price = price
                menuInfoInstance.shot = shot
                menuInfoInstance.syrup = syrup
                
            case .NonEspresso(let price, let temp) :
                menuInfoInstance.name = menuName
                menuInfoInstance.price = price
                menuInfoInstance.temp = temp
                
            case .Tea(let price) :
                menuInfoInstance.name = menuName
                menuInfoInstance.price = price
                
            case .Signature(let price, let shot, let temp, let getWay) :
                menuInfoInstance.name = menuName
                menuInfoInstance.price = price
                menuInfoInstance.shot = shot
                menuInfoInstance.temp = temp
                menuInfoInstance.getWay = getWay
            }
        }
    }
    
    func setErrorMessage(errorCase: String) {
        switch errorCase {
        case "핫/아이스" :
            self.errorMessage = "핫/아이스를 선택해주세요 :)"
            
        case "포장/매장" :
            self.errorMessage = "포장/매장을 선택해주세요 :)"
            
        default :
            self.errorMessage = "옵션을 선택해주세요 :)"
        }
    }

    func DeciamlWon(value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
        
        return result
    }
    
    private init() {    }
}
