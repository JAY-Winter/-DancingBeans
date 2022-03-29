//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import UIKit

class MenuListViewController: UIViewController {
    let main = MainModel.shared
    var count: Int = 210
    
    //--------------------------------------------------------------------------------------------
    @IBOutlet var menuChooseButton: [UIButton]!
    
    private var viewLabel = UILabel()
    //--------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLabel.text = "MENU"
        viewLabel.font = UIFont(name: "Gill Sans Bold", size: 40)
        view.addSubview(viewLabel)
        
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        viewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        var cons: CGFloat = 200
        for menuButton in menuChooseButton {
            menuButton.translatesAutoresizingMaskIntoConstraints = false
            
            menuButton.heightAnchor.constraint(equalToConstant: 60).isActive = true // 높이 60
            
            menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: cons).isActive = true
            
            menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            
            cons += 80
        }
    }
    
    // MARK: - User actions
    
    @IBAction func selectMenuButtonTapped(_ sender: UIButton) {
        let SelectOptionVC = storyboard?.instantiateViewController(identifier: "SelectOptionViewController") as! SelectOptionViewController
        
        if let menu = sender.titleLabel?.text! {
            // main.setCommonMenuInfo(menuName: menu)
            
            // SelectOptionVC.defaultMenuName = main.menuInfoInstance.name
            // SelectOptionVC.defaultMenuPrice = main.menuInfoInstance.price
            // SelectOptionVC.menuDescription = main.menuInfoInstance.detail
            
            if let menuImage = UIImage(named: menu) {
                SelectOptionVC.menuImage = menuImage
            } else {
                SelectOptionVC.menuImage = UIImage(named: "Sorry :(")
            }
            
            // setCommonMenuInfo 가 정상적으로 진행되지 않았으면 present 가 되지 말아야함
            
            self.present(SelectOptionVC, animated: true, completion: nil)
            
        }
    }
}

