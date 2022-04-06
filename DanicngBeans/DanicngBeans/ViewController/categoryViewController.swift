//
//  categoryViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/28.

import UIKit

class categoryViewController: UIViewController {

    private let uiModel = UIModel()
    private lazy var order = uiModel.setSelectButton(buttonTitle: "ORDER", font: "Gill Sans Bold", fontSize: 30, fontColor: .black, backGroundColor: .white, buttonWidth: 100, buttonHeight: 50, view: self.view)
    
    
    private var categoryList: [String] = ["COFFEE", "NON COFFEE", "FILTER", "DESSERT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
 // MARK: - func List
    
    func setView() {
        var defaultHeight: CGFloat = view.frame.height/5
        
        for list in categoryList {
            let button = uiModel.setSelectButton(buttonTitle: list, font: "Gill Sans Bold", fontSize: 30, fontColor: .black, backGroundColor: .white, buttonWidth: self.view.frame.width-20, buttonHeight: 40, view: self.view)
            
            button.addTarget(self, action: #selector(pushMenuListVC(_:)), for: .touchUpInside)
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: defaultHeight).isActive = true
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            defaultHeight += 150
        }
        self.order.addTarget(self, action: #selector(presentPavVC), for: .touchUpInside)
        order.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        order.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
    
    
    @objc func presentPavVC() {
        let page = self.storyboard?.instantiateViewController(withIdentifier: "PayTableViewController") as! PayTableViewController
        self.navigationController?.pushViewController(page, animated: true)
    }
   
    
    @objc
    func pushMenuListVC(_ sender: UIButton){
        let menuListVC = storyboard?.instantiateViewController(identifier: "MenuListVC") as! menuListViewController

        switch sender.titleLabel?.text {
        case "COFFEE" :
            self.navigationController?.pushViewController(menuListVC, animated: true)
            menuListVC.menuType = "COFFEE"
            
        case "NON COFFEE" :
            self.navigationController?.pushViewController(menuListVC, animated: true)
            menuListVC.menuType = "NON COFFEE"
            
        case "FILTER" :
            self.navigationController?.pushViewController(menuListVC, animated: true)
            menuListVC.menuType = "FILTER"
            
        case "DESSERT" :
            self.navigationController?.pushViewController(menuListVC, animated: true)
            menuListVC.menuType = "DESSERT"
            
        default : break
        }
    }
}
