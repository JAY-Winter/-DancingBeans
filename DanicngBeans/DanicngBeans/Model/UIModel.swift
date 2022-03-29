//
//  UIModel.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/29.
//

import Foundation

class UIModel {
    
    static let shared = UIModel()

    var coffeeMenuList = ["Espresso", "Americano", "Dancing Latte", "Einspanner", "Flat White", "Latte", "Vanilla Latte"]
    var nonCoffeeMenuList = ["Graviola Coconut Latte", "Pink Guava Ade", "Pineapple Ade", "Vuco Fresh Juice", "Milk Tea", "Gold Medal Apple Juice", "Marco Polo"]
    var filterMenuList = ["Blend", "Single Origin"]
    var dessertMenuList = ["Plain Croffle", "Brown Cheese Croffle", "Plain Scone", "Egg Tart", "Add"]


    
    var menuInfoInstance = menuInfo()
    
    var menuList : Dictionary<String, Drink> =
    [
        "Americano" : .Espresso(count: 1, price: 3500, shot: 2, syrup: 0, detail: "아메리카노"),
        "Latte" : .Espresso(count: 1, price: 4000, shot: 2, syrup: 0, detail: "라떼"),
        "Dancing Latte" : .Espresso(count: 1, price: 5000, shot: 2, syrup: 0, detail: "댄싱라떼"),
        "Vanilla Latte" : .Espresso(count: 1, price: 4500, shot: 2, syrup: 2, detail: "바닐라라떼"),
        "Ein Spanner" : .Signature(count: 1, price: 6000, shot: 2, temp: "ICED ONLY", getWay: "매장 전용", detail: "매장전용, 아이스만 가능한 아인슈페너"),
        "Black Tea" : .Tea(count: 1, price: 7000, detail: "블랙티")
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
        case Espresso(count: Int, price: Int, shot: Int, syrup: Int?, detail: String)
        case NonEspresso(count: Int, price: Int, temp: String, detail: String)
        case Tea(count: Int, price: Int, detail: String)
        case Signature(count: Int, price: Int, shot: Int, temp: String, getWay: String, detail: String)
    }
    
    // MARK: - User actions
    struct menuInfo {
        var name: String!
        var count: Int!
        var price: Int!
        var shot: Int?
        var syrup: Int?
        var getWay: String!
        var temp: String?
        var detail: String!
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
            case .Espresso(let count, let price, let shot, let syrup, let detail) :
                menuInfoInstance.name = menuName
                menuInfoInstance.count = count
                menuInfoInstance.price = price
                menuInfoInstance.shot = shot
                menuInfoInstance.syrup = syrup
                menuInfoInstance.detail = detail
                
            case .NonEspresso(let count, let price, let temp, let detail) :
                menuInfoInstance.name = menuName
                menuInfoInstance.count = count
                menuInfoInstance.price = price
                menuInfoInstance.temp = temp
                menuInfoInstance.detail = detail
                
            case .Tea(let count, let price, let detail) :
                menuInfoInstance.name = menuName
                menuInfoInstance.count = count
                menuInfoInstance.price = price
                menuInfoInstance.detail = detail
                
            case .Signature(let count, let price, let shot, let temp, let getWay, let detail) :
                menuInfoInstance.name = menuName
                menuInfoInstance.count = count
                menuInfoInstance.price = price
                menuInfoInstance.shot = shot
                menuInfoInstance.temp = temp
                menuInfoInstance.getWay = getWay
                menuInfoInstance.detail = detail
                
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

    func setDeciamlWon(value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
        
        return result
    }
    
    private init() {    }
}
