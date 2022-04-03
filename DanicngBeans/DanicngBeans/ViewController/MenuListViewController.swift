//  Created by JAEHYEON on 2022/03/29.

import UIKit

class menuListViewController: UIViewController {
    
    let menuInstance = MenuInfo.shared
    
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
        button.addTarget(self, action: #selector(setSelectOptionVcTappedMenuButton), for: .touchUpInside)
    }
    
    
    @objc func setSelectOptionVcTappedMenuButton(_ sender: UIButton) {
        let SelectOptionVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectOptionViewController") as! SelectOptionViewController
        
        if let buttonTitle = sender.title(for: .normal) {
            menuInstance.setMenuOptionTappedMenuButton(menuName: buttonTitle)
            
            SelectOptionVC.defaultMenuEngName = menuInstance.name
            SelectOptionVC.defaultMenuKrName = menuInstance.kr
            SelectOptionVC.defaultMenuPrice = menuInstance.price
            
            if let image = UIImage(named: buttonTitle) {
                SelectOptionVC.menuImage = image
            } else {
                SelectOptionVC.menuImage = UIImage(named: "Sorry :(")
            }
        }
        self.present(SelectOptionVC, animated: true, completion: nil)
    }
}

