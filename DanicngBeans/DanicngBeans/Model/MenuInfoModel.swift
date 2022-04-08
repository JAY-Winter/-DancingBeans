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
   
    // payTableView 에서  를 기준으로 삼는데, 이때
    // 2개 이상의 메뉴가 담길 시, class 자체 변수인 name, price 등을 가져온다.
    
    // menuListVC 에서 다른 메뉴 선택할 때, MenuInfoModel.setMenuOptionTappedMenuButton()
    // 동작으로 class 자체 변수 name, price 등이 각 메뉴의 값에 맞게 변하게 된다.
    // 선택된 메뉴를 PUT 이후 MenuInfoModel.putMenuList 확인해보면 모든 Index 의 변수가
    // 가장 최근에 추가된 변수로 덮혀진다.
    // 이는, MenuInfoModel.putMenuList 에 추가되는 것이 기존에 MenuInfo class 자체 변수
    // name, price, count 등이 들어가게 되는데 위에 설명과 같이 메뉴가 select 될 때마다 변하기 때문에
    // 이러한 현상이 일어났던 것이었다.
    // 따라서 menu 에 관한 추가 구조체를 만들어서 이에 기존 변수를 담아 활용했다
    
    var menuInfoStructureInstance = menuInfoStructure()
    
    var menuList: Dictionary<String, menuCategory> = [
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

    var categoryList: [String] = ["COFFEE", "NON COFFEE", "FILTER", "DESSERT"]
    
    var putMenuList: [menuInfoStructure] = [menuInfoStructure]()

    // MARK: - func

    func setMenuOptionTappedMenuButton(menuName: String) {
        if let menu = menuList[menuName] {
            switch menu {
            case .coffee(_, let price, let count, let shot, let syrup,let ice, let water, let temp, let getWay, let kr) :
                menuInfoStructureInstance.name   = menuName
                menuInfoStructureInstance.price  = price
                menuInfoStructureInstance.count  = count
                menuInfoStructureInstance.shot   = shot
                menuInfoStructureInstance.syrup  = syrup
                menuInfoStructureInstance.ice    = ice
                menuInfoStructureInstance.water  = water
                menuInfoStructureInstance.temp   = temp
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr     = kr
                
            case .nonCoffee(_, let price, let count, let ice, let water, let temp, let getWay, let kr) :
                menuInfoStructureInstance.name   = menuName
                menuInfoStructureInstance.price  = price
                menuInfoStructureInstance.count  = count
                menuInfoStructureInstance.shot   = nil
                menuInfoStructureInstance.syrup  = nil
                menuInfoStructureInstance.ice    = ice
                menuInfoStructureInstance.water  = water
                menuInfoStructureInstance.temp   = temp
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr     = kr

            case .filters(_, let price, let count, let temp, let getWay, let kr) :
                menuInfoStructureInstance.name   = menuName
                menuInfoStructureInstance.price  = price
                menuInfoStructureInstance.count  = count
                menuInfoStructureInstance.shot   = nil
                menuInfoStructureInstance.syrup  = nil
                menuInfoStructureInstance.ice    = nil
                menuInfoStructureInstance.water  = nil
                menuInfoStructureInstance.temp   = temp
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr     = kr
  
            case .dessert(_, let price, let count, let getWay, let kr) :
                menuInfoStructureInstance.name   = menuName
                menuInfoStructureInstance.price  = price
                menuInfoStructureInstance.count  = count
                menuInfoStructureInstance.shot   = nil
                menuInfoStructureInstance.syrup  = nil
                menuInfoStructureInstance.ice    = nil
                menuInfoStructureInstance.water  = nil
                menuInfoStructureInstance.temp   = nil
                menuInfoStructureInstance.getWay = getWay
                menuInfoStructureInstance.kr     = kr
            }
        }
    }
}
