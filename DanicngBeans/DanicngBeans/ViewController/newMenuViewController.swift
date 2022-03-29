//
//  newMenuViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/29.
//

import UIKit

class newMenuViewController: UIViewController {
    
    let main = MainModel.shared
    
    var menuType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView(menuType: menuType)
    }
}


// MARK: - func *


extension newMenuViewController {
    
    func setView(menuType: String) {
        
        switch menuType {
        case "COFFEE" :
            var defaultHeight: CGFloat = view.frame.height/5
            
            for name in main.modifiedMenuList.keys.sorted(by: {$0 < $1}) {
                let startIdx: String.Index = name.index(name.startIndex, offsetBy: 1)
                let result = String(name[startIdx...])
                
                if let menu = main.modifiedMenuList[name] {
                    
                    switch menu {
                    case .coffee :
                        setButton(buttonTitle: result, defaultHeight: defaultHeight)
                        defaultHeight += 80
                    case .nonCoffee :
                        break
                    case .filters :
                        break
                    case .dessert :
                        break
                    }
                }
            }
        case "NON COFFEE" :
            var defaultHeight: CGFloat = view.frame.height/5
            
            for name in main.modifiedMenuList.keys.sorted(by: {$0 < $1}) {
                let startIdx: String.Index = name.index(name.startIndex, offsetBy: 1)
                let result = String(name[startIdx...])
                
                if let menu = main.modifiedMenuList[name] {
                    
                    switch menu {
                        
                    case .coffee :
                        break
                    case .nonCoffee :
                        setButton(buttonTitle: result, defaultHeight: defaultHeight)
                        defaultHeight += 80
                    case .filters :
                        break
                    case .dessert :
                        break
                    }
                }
            }
        case "FILTER" :
            var defaultHeight: CGFloat = view.frame.height/5
            
            for name in main.modifiedMenuList.keys.sorted(by: {$0 < $1}) {
                let startIdx: String.Index = name.index(name.startIndex, offsetBy: 1)
                let result = String(name[startIdx...])
                
                if let menu = main.modifiedMenuList[name] {
                    
                    switch menu {
                        
                    case .coffee :
                        break
                    case .nonCoffee :
                        break
                    case .filters :
                        setButton(buttonTitle: result, defaultHeight: defaultHeight)
                        defaultHeight += 80
                    case .dessert :
                        break
                    }
                }
            }
        case "DESSERT" :
            var defaultHeight: CGFloat = view.frame.height/5
            
            for name in main.modifiedMenuList.keys.sorted(by: {$0 < $1}) {
                let startIdx: String.Index = name.index(name.startIndex, offsetBy: 1)
                let result = String(name[startIdx...])
                
                if let menu = main.modifiedMenuList[name] {
                    
                    switch menu {
                    case .coffee :
                        break
                    case .nonCoffee :
                        break
                    case .filters :
                        break
                    case .dessert :
                        setButton(buttonTitle: result, defaultHeight: defaultHeight)
                        defaultHeight += 80
                    }
                }
            }
        default : break
        }
    }
    
    
    func setButton(buttonTitle: String, defaultHeight: CGFloat) {
        let button = UIButton()
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setBackgroundColor(.gray, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: defaultHeight).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        button.addTarget(self, action: #selector(tappedSetButton), for: .touchUpInside)
    }
    
    
    @objc func tappedSetButton(_ sender: UIButton) {
        
        main.setMenuDetailedOptionByTappedMenuButton(menuName: "1Espresso")
        // main.setMenuDetailedOptionByTappedMenuButton(menuName: ("1\(String(describing: sender.titleLabel?.text!))"))
        
        // print("1\(String(describing: sender.titleLabel?.text!).description )")
        
        
        
        let SelectOptionVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectOptionViewController") as! SelectOptionViewController
        
        // SelectOptionVC.defaultMenuName = main.modifiedMenuInfoInstance.name
        // SelectOptionVC.defaultMenuPrice = main.modifiedMenuInfoInstance.price
        SelectOptionVC.menuDescription = main.modifiedMenuInfoInstance.kr
        
        self.present(SelectOptionVC, animated: true, completion: nil)
    }
}
