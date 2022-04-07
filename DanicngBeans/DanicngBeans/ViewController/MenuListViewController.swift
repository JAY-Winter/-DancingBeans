//  Created by JAEHYEON on 2022/03/29.

import UIKit

class menuListViewController: UIViewController {
    
    private let menuInstance = MenuInfo.shared
    private let uiModel = UIModel()
    
    var menuType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMenuListView(menuType: menuType)
    }
}


// MARK: - func 

extension menuListViewController {
    
    func setMenuListView(menuType: String) {
        var irregularlyPrArr: Dictionary<Int, String> = [:]
        
        // menu별 pr(priority)를 정리 후 setButtonListView
        switch menuType {
        case "COFFEE" :
            for menuName in menuInstance.menuList.keys {
                if let cons = menuInstance.menuList[menuName] {
                    switch cons {
                    case .coffee(let pr, _, _, _, _, _, _, _, _, _) :
                        irregularlyPrArr[pr] = menuName
                    case .nonCoffee :
                        break
                    case .filters :
                        break
                    case .dessert :
                        break
                    }
                }
            }
            setButtonList(beforeArr: irregularlyPrArr)
            
        case "NON COFFEE" :
            for menuName in menuInstance.menuList.keys {
                if let cons = menuInstance.menuList[menuName] {
                    switch cons {
                    case .coffee :
                        break
                    case .nonCoffee(let pr, _, _, _, _, _, _, _) :
                        irregularlyPrArr[pr] = menuName
                    case .filters :
                        break
                    case .dessert :
                        break
                    }
                }
            }
            setButtonList(beforeArr: irregularlyPrArr)
            
        case "FILTER" :
            for menuName in menuInstance.menuList.keys {
                if let cons = menuInstance.menuList[menuName] {
                    switch cons {
                    case .coffee:
                        break
                    case .nonCoffee:
                        break
                    case .filters(let pr, _, _, _, _, _) :
                        irregularlyPrArr[pr] = menuName
                    case .dessert :
                        break
                    }
                }
            }
            setButtonList(beforeArr: irregularlyPrArr)
            
        case "DESSERT" :
            for menuName in menuInstance.menuList.keys {
                if let cons = menuInstance.menuList[menuName] {
                    switch cons {
                    case .coffee:
                        break
                    case .nonCoffee:
                        break
                    case .filters:
                        break
                    case .dessert(let pr, _, _, _, _) :
                        irregularlyPrArr[pr] = menuName
                    }
                }
            }
            setButtonList(beforeArr: irregularlyPrArr)
        default : break
        }
    }
    
    
    func setButtonList(beforeArr: Dictionary<Int, String>) {
        var spacingFromTop: CGFloat = view.frame.height/7
        let sortedprArr = beforeArr.sorted { $0.0 < $1.0}
        
        for (_, name) in sortedprArr {
            let button
            = uiModel.setSelectButton(buttonTitle: name, font: "HelveticaNeue", fontSize: 15, fontColor: .black, backGroundColor: UIColor(named: "customGray")!, buttonWidth: self.view.frame.width-40, buttonHeight: 50, view: self.view)
            
            button.configuration?.titleAlignment = .leading
            // button.titleLabel?.textAlignment = .left
            
            button.addTarget(self, action: #selector(setSelectOptionVcTappedMenuButton(_:)), for: .touchUpInside)
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: spacingFromTop).isActive = true
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            // button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true

            spacingFromTop += 90
        }
    }
    
    
    @objc func setSelectOptionVcTappedMenuButton(_ sender: UIButton) {
        let SelectOptionVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectOptionViewController") as! SelectOptionViewController
        
        if let buttonTitle = sender.title(for: .normal) {
            menuInstance.setMenuOptionTappedMenuButton(menuName: buttonTitle)
            
            SelectOptionVC.defaultMenuEngName = menuInstance.menuInfoStructureInstance.name
            SelectOptionVC.defaultMenuKrName = menuInstance.menuInfoStructureInstance.kr
            SelectOptionVC.defaultMenuPrice = menuInstance.menuInfoStructureInstance.price
        }
        self.present(SelectOptionVC, animated: true, completion: nil)
    }
}

