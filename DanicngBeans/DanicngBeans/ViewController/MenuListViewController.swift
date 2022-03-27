//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import UIKit

class MenuListViewController: UIViewController {
    let main = MainModel.shared
    
    //--------------------------------------------------------------------------------------------
    @IBOutlet var menuChooseButton: [UIButton]!
    
    //--------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - User actions
    
    @IBAction func selectMenuButtonTapped(_ sender: UIButton) {
        let SelectOptionVC = storyboard?.instantiateViewController(identifier: "SelectOptionViewController") as! SelectOptionViewController
        
        if let menu = sender.titleLabel?.text! {
            main.setCommonMenuInfo(menuName: menu)
            
            SelectOptionVC.defaultMenuName = main.menuInfoInstance.name
            SelectOptionVC.defaultMenuPrice = main.menuInfoInstance.price
            SelectOptionVC.menuDescription = main.menuInfoInstance.detail
            
            if let menuImage = UIImage(named: menu) {
                SelectOptionVC.menuImage = menuImage
            } else {
                SelectOptionVC.menuImage = UIImage(named: "Sorry :(")
            }

            // setCommonMenuInfo 가 정상적으로 진행되지 않았으면 present 가 되지 말아야함
            do{
                self.present(SelectOptionVC, animated: true, completion: nil)
            }
        }
    }
}

