//
//  mainModel.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/22.


import Foundation
import UIKit

class MainModel {
    
    static let shared = MainModel()
    
    enum menuCategory {
        case coffee(pr: Int, price: Int, count: Int, shot: Int, syrup: Int, ice: String, water: String, temp: String?, getWay: String?, kr: String)
        case nonCoffee(pr: Int, price: Int, count: Int, ice: String, water: String, temp: String?, getWay: String?, kr: String)
        case filters(pr: Int, price: Int, count: Int, temp: String?, getWay: String?, kr: String)
        case dessert(pr: Int, price: Int, count: Int, getWay: String?, kr: String)
    }
    
    enum personalOption {
        case shot
        case ice
        case water
        case syrup
    }

    struct ModifiedMenuInfo {
        var name: String!
        var price: Int!
        var count: Int!
        var shot: Int?
        var syrup: Int?
        var ice: String?
        var water: String?
        var temp: String?
        var getWay: String?
        var kr: String!
    }
    
    // class ModifiedMenuInfo {
    //     var name: String!
    //     var price: Int!
    //     var count: Int!
    //     var shot: Int?
    //     var temp: String?
    //     var getWay: String?
    //     var syrup: Int?
    //     var kr: String!
    // }

    
    var modifiedMenuInfoInstance: ModifiedMenuInfo = ModifiedMenuInfo()
    
    var addedMenuList: [ModifiedMenuInfo] = [ModifiedMenuInfo]()
    
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
    
    var modifiedMenuList: Dictionary<String, menuCategory> = [
        // coffee
        "Espresso"               : .coffee(pr: 1, price: 3000, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "에스프레소"),
        "Americano"              : .coffee(pr: 2, price: 3500, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "아메리카노"),
        "Dancing Latte"          : .coffee(pr: 3, price: 5500, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "시그니처 넛츠 크림 라떼"),
        "Einspanner"             : .coffee(pr: 4, price: 5500, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "아인슈페너"),
        "Flat White"             : .coffee(pr: 5, price: 4000, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "플랫 화이트"),
        "Latte"                  : .coffee(pr: 6, price: 4000, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "라떼"),
        "Vanilla Latte"          : .coffee(pr: 7, price: 4500, count: 1, shot: 2, syrup : 2, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "바닐라 라떼"),
        // nonCoffee
        "Graviola Coconut Latte" : .nonCoffee(pr: 1, price: 5000, count: 1, ice: "보통", water: "보통", temp: "ONLY ICED", getWay: "매장 전용", kr: "시그니처 그라비올라 코코넛 라떼"),
        "Pink Guava Ade"         : .nonCoffee(pr: 2, price: 5000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "핑크구아바 에이드"),
        "Pineapple Ade"          : .nonCoffee(pr: 3, price: 5000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "파인애플 에이드"),
        "Vuco Fresh Juice"       : .nonCoffee(pr: 4, price: 5000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "뷰코 프레쉬 주스 비가열 착즙"),
        "Milk Tea"               : .nonCoffee(pr: 5, price: 4000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "밀크티"),
        "Gold Medal Apple Juice" : .nonCoffee(pr: 6, price: 3500, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "골드메달 애플 주스"),
        "Marco Polo"             : .nonCoffee(pr: 7, price: 5500, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "마르코 폴로"),
        // filter
        "Blend"                  : .filters(pr: 1, price: 5000, count: 1, temp: nil, getWay: nil, kr: "블렌드"),
        "Single Origin"          : .filters(pr: 2, price: 6000, count: 1, temp: nil, getWay: nil, kr: "싱글 오리진"),
        // dessert
        "Plain Croffle"          : .dessert(pr: 1, price: 2500, count: 1, getWay: nil, kr: "플레인 크로플"),
        "Brown Cheese Croffle"   : .dessert(pr: 2, price: 5000, count: 1, getWay: nil, kr: "브라운 치즈 크로플"),
        "Plain Scone"            : .dessert(pr: 3, price: 3500, count: 1, getWay: nil, kr: "플레인 스콘"),
        "Egg Tart"               : .dessert(pr: 4, price: 3500, count: 1, getWay: nil, kr: "에그 타르트")
    ]
    
    // 각 메뉴별 버튼 누를시 menu Instance 설정 및 menuDetailedOptionView 설정
    func setMenuDetailedOptionByTappedMenuButton(menuName: String) {
        
        if let menu = modifiedMenuList[menuName] {
            
            switch menu {
            case .coffee(_, let price, let count, let shot, let syrup,let ice, let water, let temp, let getWay, let kr) :
                modifiedMenuInfoInstance.name   = menuName
                modifiedMenuInfoInstance.price  = price
                modifiedMenuInfoInstance.count  = count
                modifiedMenuInfoInstance.shot   = shot
                modifiedMenuInfoInstance.syrup  = syrup
                modifiedMenuInfoInstance.ice    = ice
                modifiedMenuInfoInstance.water  = water
                modifiedMenuInfoInstance.temp   = temp
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.kr     = kr
                
            case .nonCoffee(_, let price, let count, let ice, let water, let temp, let getWay, let kr) :
                modifiedMenuInfoInstance.name   = menuName
                modifiedMenuInfoInstance.price  = price
                modifiedMenuInfoInstance.count  = count
                modifiedMenuInfoInstance.ice    = ice
                modifiedMenuInfoInstance.water  = water
                modifiedMenuInfoInstance.temp   = temp
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.kr     = kr
                
            case .filters(_, let price, let count, let temp, let getWay, let kr) :
                modifiedMenuInfoInstance.name   = menuName
                modifiedMenuInfoInstance.price  = price
                modifiedMenuInfoInstance.count  = count
                modifiedMenuInfoInstance.temp   = temp
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.kr     = kr
                
            case .dessert(_, let price, let count, let getWay, let kr) :
                modifiedMenuInfoInstance.name   = menuName
                modifiedMenuInfoInstance.price  = price
                modifiedMenuInfoInstance.count  = count
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.kr     = kr
            }
        }
    }
    
    // MARK: - User actions
    
    private init() {    }
    
    
    func initMenuInfoInstance() {
        modifiedMenuInfoInstance.name = nil
        modifiedMenuInfoInstance.price = nil
        modifiedMenuInfoInstance.count = nil
        modifiedMenuInfoInstance.shot = nil
        modifiedMenuInfoInstance.syrup = nil
        modifiedMenuInfoInstance.ice = nil
        modifiedMenuInfoInstance.water = nil
        modifiedMenuInfoInstance.temp = nil
        modifiedMenuInfoInstance.getWay = nil
        
        modifiedMenuInfoInstance.kr = nil
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
    
    func calculateAddedPrice(sender: UIStepper, menuPrice: Int) -> Int {
        let menuCount = Int(sender.value)
        
        let calculatedPrice = menuCount * menuPrice
        
        return calculatedPrice
    }
}






//MARK: - 기존 구조

class oldMainModel {
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
    
    enum Drink {
        case Espresso(count: Int, price: Int, shot: Int, syrup: Int?, detail: String)
        case NonEspresso(count: Int, price: Int, temp: String, detail: String)
        case Tea(count: Int, price: Int, detail: String)
        case Signature(count: Int, price: Int, shot: Int, temp: String, getWay: String, detail: String)
    }
    
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
}



