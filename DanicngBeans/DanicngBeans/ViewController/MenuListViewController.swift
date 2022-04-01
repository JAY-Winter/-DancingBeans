//
//  newMenuViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/29.
//

import UIKit

class menuListViewController: UIViewController {
    
    let main = MainModel.shared
    
    var menuType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView(menuType: menuType)
    }
}


// MARK: - func 

extension menuListViewController {
    
    func setView(menuType: String) {
        
        var appendedPrArrIrregularly: Dictionary<Int, String> = [:]
        
        switch menuType {
        case "COFFEE" :
            for menuName in main.menuList.keys {
                if let cons = main.menuList[menuName] {
                    switch cons {
                    case .coffee(let pr, _, _, _, _, _, _, _, _, _) :
                        appendedPrArrIrregularly[pr] = menuName
                    case .nonCoffee :
                        break
                    case .filters :
                        break
                    case .dessert :
                        break
                    }
                }
            }
            setButtonList(beforeArr: appendedPrArrIrregularly)
            
        case "NON COFFEE" :
            for menuName in main.menuList.keys {
                if let cons = main.menuList[menuName] {
                    switch cons {
                    case .coffee :
                        break
                    case .nonCoffee(let pr, _, _, _, _, _, _, _) :
                        appendedPrArrIrregularly[pr] = menuName
                    case .filters :
                        break
                    case .dessert :
                        break
                    }
                }
            }
            setButtonList(beforeArr: appendedPrArrIrregularly)
            
        case "FILTER" :
            for menuName in main.menuList.keys {
                if let cons = main.menuList[menuName] {
                    switch cons {
                    case .coffee:
                        break
                    case .nonCoffee:
                        break
                    case .filters(let pr, _, _, _, _, _) :
                        appendedPrArrIrregularly[pr] = menuName
                    case .dessert :
                        break
                    }
                }
            }
            setButtonList(beforeArr: appendedPrArrIrregularly)
            
        case "DESSERT" :
            for menuName in main.menuList.keys {
                if let cons = main.menuList[menuName] {
                    switch cons {
                    case .coffee:
                        break
                    case .nonCoffee:
                        break
                    case .filters:
                        break
                    case .dessert(let pr, _, _, _, _) :
                        appendedPrArrIrregularly[pr] = menuName
                    }
                }
            }
            setButtonList(beforeArr: appendedPrArrIrregularly)
        default : break
        }
    }
    
    
    func setButtonList(beforeArr: Dictionary<Int, String>) {
        var spacingFromTop: CGFloat = view.frame.height/7
        let sortedprArr = beforeArr.sorted { $0.0 < $1.0}
        
        for (_, name) in sortedprArr {
            setButton(buttonTitle: name, defaultHeight: spacingFromTop)
            spacingFromTop += 90
        }
    }
    
    
    func setButton(buttonTitle: String, defaultHeight: CGFloat) {
        let button = UIButton(type: .system)
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = UIColor(named: "customGray")?.withAlphaComponent(0.7)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: defaultHeight).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedSetButton), for: .touchUpInside)
    }
    
    
    @objc func tappedSetButton(_ sender: UIButton) {
        let SelectOptionVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectOptionViewController") as! SelectOptionViewController
        
        if let buttonTitle = sender.title(for: .normal) {
            main.setMenuDetailedOptionByTappedMenuButton(menuName: buttonTitle)
            
            SelectOptionVC.defaultMenuEngName = main.menuInfoInstance.name
            SelectOptionVC.defaultMenuKrName = main.menuInfoInstance.kr
            SelectOptionVC.defaultMenuPrice = main.menuInfoInstance.price
            SelectOptionVC.menuKrName = main.menuInfoInstance.kr
            
            if let image = UIImage(named: buttonTitle) {
                SelectOptionVC.menuImage = image
            } else {
                SelectOptionVC.menuImage = UIImage(named: "Sorry :(")
            }
            
            switch main.menuList[buttonTitle] {
            case .coffee :
                SelectOptionVC.menuType = "coffee"
            case .nonCoffee :
                SelectOptionVC.menuType = "nonCoffee"
            case .filters :
                SelectOptionVC.menuType = "filters"
            case .dessert :
                SelectOptionVC.menuType = "dessert"
            default :
                break
            }
        }
        self.present(SelectOptionVC, animated: true, completion: nil)
    }
}
