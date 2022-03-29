//
//  mainModel.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/22.


import Foundation
import UIKit

class MainModel {
    
    static let shared = MainModel()
    
    struct modifiedMenuInfo {
        var name: String!
        var price: Int!
        var count: Int!
        var shot: Int?
        var temp: String!
        var getWay: String!
        var syrup: Int?
        var kr: String!
    }
    
    enum menuCategory {
        case coffee(price: Int, count: Int, shot: Int, syrup: Int, temp: String, getWay: String, kr: String)
        case nonCoffee(price: Int, count: Int, temp: String, getWay: String, kr: String)
        case filters(price: Int, count: Int, temp: String, getWay: String, kr: String)
        case dessert(price: Int, count: Int, getWay: String, kr: String)
    }
    
    var modifiedMenuInfoInstance = modifiedMenuInfo()
    
    var coffeeMenuList = [
        "Espresso", "Americano", "Dancing Latte", "Einspanner", "Flat White", "Latte", "Vanilla Latte"
    ]
    
    var modifiedMenuList: Dictionary<String, menuCategory> = [
        "1Espresso" : .coffee(price: 3000, count: 1, shot: 2, syrup: 0, temp: "default", getWay: "default", kr: "에스프레소"),
        "2Americano" : .coffee(price: 3500, count: 1, shot: 2, syrup: 0, temp: "default", getWay: "default", kr: "아메리카노"),
        "3Dancing Latte" : .coffee(price: 5500, count: 1, shot: 2, syrup: 0, temp: "ONLY ICED ", getWay: "매장 전용", kr: "시그니처 넛츠 크림 라떼"),
        "4Einspanner" : .coffee(price: 5500, count: 1, shot: 2, syrup: 0, temp: "default", getWay: "default", kr: "아인슈페너"),
        "5Flat White" : .coffee(price: 4000, count: 1, shot: 2, syrup: 0, temp: "default", getWay: "default", kr: "플랫 화이트"),
        "6Latte" : .coffee(price: 4000, count: 1, shot: 2, syrup: 0, temp: "default", getWay: "default", kr: "라떼"),
        "7Vanilla Latte" : .coffee(price: 4500, count: 1, shot: 2, syrup: 2, temp: "default", getWay: "default", kr: "바닐라 라떼"),
        
        "1Graviola Coconut Latte" : .nonCoffee(price: 5000, count: 1, temp: "ONLY ICED", getWay: "매장 전용", kr: "시그니처 그라비올라 코코넛 라떼"),
        "2Pink Guava Ade" : .nonCoffee(price: 5000, count: 1, temp: "default", getWay: "default", kr: "핑크구아바 에이드"),
        "3Pineapple Ade" : .nonCoffee(price: 5000, count: 1, temp: "default", getWay: "default", kr: "파인애플 에이드"),
        "4Vuco Fresh Juice" : .nonCoffee(price: 5000, count: 1, temp: "default", getWay: "default", kr: "뷰코 프레쉬 주스 비가열 착즙"),
        "5Milk Tea" : .nonCoffee(price: 4000, count: 1, temp: "default", getWay: "default", kr: "밀크티"),
        "6Gold Medal Apple Juice" : .nonCoffee(price: 3500, count: 1, temp: "default", getWay: "default", kr: "골드메달 애플 주스"),
        "7Marco Polo" : .nonCoffee(price: 5500, count: 1, temp: "default", getWay: "default", kr: "마르코 폴로"),
        
        "1Blend" : .filters(price: 5000, count: 1, temp: "default", getWay: "default", kr: "블렌드"),
        "2Single Origin" : .filters(price: 6000, count: 1, temp: "default", getWay: "default", kr: "싱글 오리진"),
        
        "1Plain Croffle" : .dessert(price: 2500, count: 1, getWay: "default", kr: "플레인 크로플"),
        "2Brown Cheese Croffle" : .dessert(price: 5000, count: 1, getWay: "default", kr: "브라운 치즈 크로플"),
        "3Plain Scone" : .dessert(price: 3500, count: 1, getWay: "default", kr: "플레인 스콘"),
        "4Egg Tart" : .dessert(price: 3500, count: 1, getWay: "default", kr: "에그 타르트")
    ]
    
    // 각 메뉴별 버튼 누를시 menu Instance 설정 및 menuDetailedOptionView 설정
    func setMenuDetailedOptionByTappedMenuButton(menuName: String) {
        
        if let menu = modifiedMenuList[menuName] {
            
            switch menu {
            case .coffee(let price, let count, let shot, let syrup, let temp, let getWay, let kr) :
                modifiedMenuInfoInstance.name = menuName
                modifiedMenuInfoInstance.price = price
                modifiedMenuInfoInstance.count = count
                modifiedMenuInfoInstance.shot = shot
                modifiedMenuInfoInstance.temp = temp
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.syrup = syrup
                modifiedMenuInfoInstance.kr = kr
                
            case .nonCoffee(let price, let count, let temp, let getWay, let kr) :
                modifiedMenuInfoInstance.name = menuName
                modifiedMenuInfoInstance.price = price
                modifiedMenuInfoInstance.count = count
                modifiedMenuInfoInstance.temp = temp
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.kr = kr
                
            case .filters(let price, let count, let temp, let getWay, let kr) :
                modifiedMenuInfoInstance.name = menuName
                modifiedMenuInfoInstance.price = price
                modifiedMenuInfoInstance.count = count
                modifiedMenuInfoInstance.temp = temp
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.kr = kr
                
            case .dessert(let price, let count, let getWay, let kr) :
                modifiedMenuInfoInstance.name = menuName
                modifiedMenuInfoInstance.price = price
                modifiedMenuInfoInstance.count = count
                modifiedMenuInfoInstance.getWay = getWay
                modifiedMenuInfoInstance.kr = kr
                
            }
        }
    }
    
    
    var addedMenuList: [modifiedMenuInfo] = [modifiedMenuInfo]()
    
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
    
    func initMenuInfoInstance() {
        modifiedMenuInfoInstance.name = nil
        modifiedMenuInfoInstance.price = nil
        modifiedMenuInfoInstance.count = nil
        modifiedMenuInfoInstance.shot = nil
        modifiedMenuInfoInstance.temp = nil
        modifiedMenuInfoInstance.getWay = nil
        modifiedMenuInfoInstance.syrup = nil
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
    
    
    private init() {    }
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



