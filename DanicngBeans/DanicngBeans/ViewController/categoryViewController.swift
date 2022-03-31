//
//  categoryViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/28.
//

import UIKit

class categoryViewController: UIViewController {
    
    let main = MainModel.shared
    
    var coffee: UIButton!
    var noncoffee: UIButton!
    var filter: UIButton!
    var dessert: UIButton!
    var coffee2: UIButton!
    var noncoffee2: UIButton!
    var filter2: UIButton!
    var dessert2: UIButton!
    var order: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let defaultHeight: CGFloat = view.frame.height/5
        
        coffee = UIButton()
        coffee.setTitle("COFFEE", for: .normal)
        coffee.titleLabel?.adjustsFontSizeToFitWidth = true
        coffee.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 30)
        coffee.setTitleColor(.black, for: .normal)
        coffee.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        coffee.addTarget(self, action: #selector(pushMenuListVC(_:)), for: .touchUpInside)
        
        noncoffee = UIButton()
        noncoffee.setTitle("NON COFFEE", for: .normal)
        noncoffee.titleLabel?.adjustsFontSizeToFitWidth = true
        noncoffee.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 30)
        noncoffee.setTitleColor(.black, for: .normal)
        noncoffee.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        noncoffee.addTarget(self, action: #selector(pushMenuListVC(_:)), for: .touchUpInside)
        
        filter = UIButton()
        filter.setTitle("FILTER", for: .normal)
        filter.titleLabel?.adjustsFontSizeToFitWidth = true
        filter.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 30)
        filter.setTitleColor(.black, for: .normal)
        filter.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        filter.addTarget(self, action: #selector(pushMenuListVC(_:)), for: .touchUpInside)
        
        dessert = UIButton()
        dessert.setTitle("DESSERT", for: .normal)
        dessert.titleLabel?.adjustsFontSizeToFitWidth = true
        dessert.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 30)
        dessert.setTitleColor(.black, for: .normal)
        dessert.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        dessert.addTarget(self, action: #selector(pushMenuListVC(_:)), for: .touchUpInside)
        
        coffee2 = UIButton()
        coffee2.setTitle("", for: .normal)
        // coffee2.backgroundColor = UIColor(named: "customSet2_1")
        
        noncoffee2 = UIButton()
        noncoffee2.setTitle("", for: .normal)
        // noncoffee2.backgroundColor = UIColor(named: "customSet2_2")
        
        filter2 = UIButton()
        filter2.setTitle("", for: .normal)
        // filter2.backgroundColor = UIColor(named: "customSet2_3")
        
        dessert2 = UIButton()
        dessert2.setTitle("", for: .normal)
        // dessert2.backgroundColor = UIColor(named: "customSet2_4")
        
        order = UIButton()
        order.setTitle("ORDER", for: .normal)
        order.titleLabel?.adjustsFontSizeToFitWidth = true
        order.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 20)
        order.setTitleColor(.black, for: .normal)
        order.addTarget(self, action: #selector(presentPavVC), for: .touchUpInside)
        
        view.addSubview(coffee)
        view.addSubview(noncoffee)
        view.addSubview(filter)
        view.addSubview(dessert)
        view.addSubview(coffee2)
        view.addSubview(noncoffee2)
        view.addSubview(filter2)
        view.addSubview(dessert2)
        view.addSubview(order)
        
        coffee.setBackgroundColor(.white, for: .normal)
        coffee.translatesAutoresizingMaskIntoConstraints = false
        coffee.topAnchor.constraint(equalTo: view.topAnchor, constant: defaultHeight-10).isActive = true
        coffee.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        noncoffee.translatesAutoresizingMaskIntoConstraints = false
        noncoffee.topAnchor.constraint(equalTo: coffee.bottomAnchor, constant: 90).isActive = true
        noncoffee.widthAnchor.constraint(equalToConstant: view.frame.size.width/2).isActive = true
        noncoffee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        filter.translatesAutoresizingMaskIntoConstraints = false
        filter.topAnchor.constraint(equalTo: noncoffee.bottomAnchor, constant: 90).isActive = true
        filter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        dessert.translatesAutoresizingMaskIntoConstraints = false
        dessert.topAnchor.constraint(equalTo: filter.bottomAnchor, constant: 90).isActive = true
        dessert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        coffee2.translatesAutoresizingMaskIntoConstraints = false
        coffee2.topAnchor.constraint(equalTo: view.topAnchor, constant: defaultHeight).isActive = true
        coffee2.leadingAnchor.constraint(equalTo: coffee.trailingAnchor, constant: 10).isActive = true
        coffee2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        noncoffee2.translatesAutoresizingMaskIntoConstraints = false
        noncoffee2.topAnchor.constraint(equalTo: coffee.bottomAnchor, constant: 100).isActive = true
        noncoffee2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        noncoffee2.trailingAnchor.constraint(equalTo: noncoffee.leadingAnchor, constant: -10).isActive = true
        
        filter2.translatesAutoresizingMaskIntoConstraints = false
        filter2.topAnchor.constraint(equalTo: noncoffee.bottomAnchor, constant: 100).isActive = true
        filter2.leadingAnchor.constraint(equalTo: filter.trailingAnchor, constant: 10).isActive = true
        filter2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        dessert2.translatesAutoresizingMaskIntoConstraints = false
        dessert2.topAnchor.constraint(equalTo: filter.bottomAnchor, constant: 100).isActive = true
        dessert2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        dessert2.trailingAnchor.constraint(equalTo: dessert.leadingAnchor, constant: -10).isActive = true
        
        order.translatesAutoresizingMaskIntoConstraints = false
        order.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        order.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
    
 
    @objc func presentPavVC() {
        let page = self.storyboard?.instantiateViewController(withIdentifier: "PayTableViewController") as! PayTableViewController
        self.navigationController?.pushViewController(page, animated: true)
    }
   
    
    @objc
    func pushMenuListVC(_ sender: UIButton){
        let menuListVC = storyboard?.instantiateViewController(identifier: "newMenuListVC") as! menuListViewController
        
        
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
