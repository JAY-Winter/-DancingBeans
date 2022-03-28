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
    var orderButton: UIButton!
    //--------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLabel.text = "MENU"
        viewLabel.font = UIFont(name: "Gill Sans Bold", size: 40)
        
        orderButton = UIButton(type: .system)
        orderButton.setTitle("ORDER", for: .normal)
        orderButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.backgroundColor = .systemBlue
        orderButton.layer.cornerRadius = 12
        orderButton.addTarget(self, action: #selector(regSegue), for: .touchUpInside)
        
        view.addSubview(viewLabel)
        view.addSubview(orderButton)
        
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        viewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        var cons: CGFloat = 200
        for menuButton in menuChooseButton {
            menuButton.translatesAutoresizingMaskIntoConstraints = false
            
            menuButton.heightAnchor.constraint(equalToConstant: 60).isActive = true // 높이 60
            
            menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: cons).isActive = true
            
            menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            
            cons += 80
        }
        
        orderButton.layer.cornerRadius = 12
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        
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
            
            self.present(SelectOptionVC, animated: true, completion: nil)
            
        }
    }
    
    @objc
    func regSegue() {
        let page = self.storyboard?.instantiateViewController(withIdentifier: "PayTableViewController") as! PayTableViewController
        self.navigationController?.pushViewController(page, animated: true)
    }
}

