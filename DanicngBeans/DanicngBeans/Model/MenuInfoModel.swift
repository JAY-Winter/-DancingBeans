//  Created by JAEHYEON on 2022/04/02.

import Foundation

class MenuInfo {

    static let shared = MenuInfo()

    private init() { }

    enum menuCategory {
        case coffee(pr: Int, price: Int, count: Int, shot: Int, syrup: Int, ice: String, water: String, temp: String?, getWay: String?, kr: String)
        case nonCoffee(pr: Int, price: Int, count: Int, ice: String, water: String, temp: String?, getWay: String?, kr: String)
        case filters(pr: Int, price: Int, count: Int, temp: String?, getWay: String?, kr: String)
        case dessert(pr: Int, price: Int, count: Int, getWay: String?, kr: String)
    }

    struct menuInfoStructure {
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
   
    var menuInfoStructureInstance = menuInfoStructure()
    
    var menuList: Dictionary<String, menuCategory> = [
        // coffee
        "Espresso": .coffee(pr: 1, price: 3000, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "에스프레소"),
        "Americano": .coffee(pr: 2, price: 3500, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "아메리카노"),
        "Dancing Latte": .coffee(pr: 3, price: 5500, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "시그니처 넛츠 크림 라떼"),
        "Einspanner": .coffee(pr: 4, price: 5500, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "아인슈페너"),
        "Flat White": .coffee(pr: 5, price: 4000, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "플랫 화이트"),
        "Latte": .coffee(pr: 6, price: 4000, count: 1, shot: 2, syrup : 0, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "라떼"),
        "Vanilla Latte": .coffee(pr: 7, price: 4500, count: 1, shot: 2, syrup : 2, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "바닐라 라떼"),
        // nonCoffee
        "Graviola Coconut Latte": .nonCoffee(pr: 1, price: 5000, count: 1, ice: "보통", water: "보통", temp: "ONLY ICED", getWay: "매장 전용", kr: "시그니처 그라비올라 코코넛 라떼"),
        "Pink Guava Ade": .nonCoffee(pr: 2, price: 5000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "핑크구아바 에이드"),
        "Pineapple Ade": .nonCoffee(pr: 3, price: 5000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "파인애플 에이드"),
        "Vuco Fresh Juice": .nonCoffee(pr: 4, price: 5000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "뷰코 프레쉬 주스 비가열 착즙"),
        "Milk Tea": .nonCoffee(pr: 5, price: 4000, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "밀크티"),
        "Gold Medal Apple Juice": .nonCoffee(pr: 6, price: 3500, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "골드메달 애플 주스"),
        "Marco Polo": .nonCoffee(pr: 7, price: 5500, count: 1, ice: "보통", water: "보통", temp: nil, getWay: nil, kr: "마르코 폴로"),
        // filter
        "Blend": .filters(pr: 1, price: 5000, count: 1, temp: nil, getWay: nil, kr: "블렌드"),
        "Single Origin": .filters(pr: 2, price: 6000, count: 1, temp: nil, getWay: nil, kr: "싱글 오리진"),
        // dessert
        "Plain Croffle": .dessert(pr: 1, price: 2500, count: 1, getWay: nil, kr: "플레인 크로플"),
        "Brown Cheese Croffle": .dessert(pr: 2, price: 5000, count: 1, getWay: nil, kr: "브라운 치즈 크로플"),
        "Plain Scone": .dessert(pr: 3, price: 3500, count: 1, getWay: nil, kr: "플레인 스콘"),
        "Egg Tart": .dessert(pr: 4, price: 3500, count: 1, getWay: nil, kr: "에그 타르트")
    ]

    var categoryList: [String] = ["COFFEE", "NON COFFEE", "FILTER", "DESSERT"]
    
    var putMenuList: [menuInfoStructure] = [menuInfoStructure]()

    // MARK: - func

    func setMenuOptionTappedMenuButton(menuName: String) -> Void {
        if let menu = menuList[menuName] {
            switch menu {
            case .coffee(_, let price, let count, let shot, let syrup,let ice, let water, let temp, let getWay, let kr):
                menuInfoStructureInstance.name = menuName
                menuInfoStructureInstance.price = price
                menuInfoStructureInstance.count = count
                menuInfoStructureInstance.shot = shot
                menuInfoStructureInstance.syrup = syrup
                menuInfoStructureInstance.ice = ice
                menuInfoStructureInstance.water = water
                menuInfoStructureInstance.temp = temp
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr = kr
                
            case .nonCoffee(_, let price, let count, let ice, let water, let temp, let getWay, let kr):
                menuInfoStructureInstance.name = menuName
                menuInfoStructureInstance.price = price
                menuInfoStructureInstance.count = count
                menuInfoStructureInstance.shot = nil
                menuInfoStructureInstance.syrup = nil
                menuInfoStructureInstance.ice = ice
                menuInfoStructureInstance.water = water
                menuInfoStructureInstance.temp = temp
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr = kr

            case .filters(_, let price, let count, let temp, let getWay, let kr):
                menuInfoStructureInstance.name = menuName
                menuInfoStructureInstance.price = price
                menuInfoStructureInstance.count = count
                menuInfoStructureInstance.shot = nil
                menuInfoStructureInstance.syrup = nil
                menuInfoStructureInstance.ice = nil
                menuInfoStructureInstance.water = nil
                menuInfoStructureInstance.temp = temp
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr = kr
  
            case .dessert(_, let price, let count, let getWay, let kr):
                menuInfoStructureInstance.name = menuName
                menuInfoStructureInstance.price = price
                menuInfoStructureInstance.count = count
                menuInfoStructureInstance.shot = nil
                menuInfoStructureInstance.syrup = nil
                menuInfoStructureInstance.ice = nil
                menuInfoStructureInstance.water = nil
                menuInfoStructureInstance.temp = nil
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr = kr
            }
        }
    }
}

