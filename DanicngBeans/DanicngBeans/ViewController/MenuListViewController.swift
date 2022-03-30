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
}

