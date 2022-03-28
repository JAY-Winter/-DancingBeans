//
//  categoryViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/28.
//

import UIKit

class categoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var coffee: UIButton!
        var noncoffee: UIButton!
        var filter: UIButton!
        var dessert: UIButton!
        var order: UIButton!
        
        coffee = UIButton()
        coffee.setTitle("COFFEE", for: .normal)
        coffee.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 25)
        coffee.setTitleColor(.black, for: .normal)
        coffee.configuration?.titleAlignment = .leading
        coffee.addTarget(self, action: #selector(presentDetailMenuList), for: .touchUpInside)
        
        noncoffee = UIButton()
        noncoffee.setTitle("NON COFFEE", for: .normal)
        noncoffee.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 25)
        noncoffee.setTitleColor(.black, for: .normal)
        noncoffee.configuration?.titleAlignment = .trailing
        noncoffee.addTarget(self, action: #selector(presentDetailMenuList), for: .touchUpInside)
        
        filter = UIButton()
        filter.setTitle("FILTER", for: .normal)
        filter.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 25)
        filter.setTitleColor(.black, for: .normal)
        filter.addTarget(self, action: #selector(presentDetailMenuList), for: .touchUpInside)
        
        dessert = UIButton()
        dessert.setTitle("DESSERT", for: .normal)
        dessert.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 25)
        dessert.setTitleColor(.black, for: .normal)
        dessert.addTarget(self, action: #selector(presentDetailMenuList), for: .touchUpInside)
        
        order = UIButton()
        order.setTitle("ORDER", for: .normal)
        order.titleLabel?.font = UIFont(name: "Gill Sans Bold", size: 20)
        order.setTitleColor(.black, for: .normal)
        order.backgroundColor = UIColor.systemGray.withAlphaComponent(0.1)
        order.addTarget(self, action: #selector(presentDetailMenuList), for: .touchUpInside)
        
        view.addSubview(coffee)
        view.addSubview(noncoffee)
        view.addSubview(filter)
        view.addSubview(dessert)
        view.addSubview(order)
        
        coffee.translatesAutoresizingMaskIntoConstraints = false
        coffee.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        coffee.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        // coffee.widthAnchor.constraint(equalToConstant: view.).isActive = true
        // coffee.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        // coffee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        noncoffee.translatesAutoresizingMaskIntoConstraints = false
        noncoffee.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        // noncoffee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        // noncoffee.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        filter.translatesAutoresizingMaskIntoConstraints = false
        filter.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        filter.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        // filter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        // filter.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        dessert.translatesAutoresizingMaskIntoConstraints = false
        dessert.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        // dessert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        // dessert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        order.translatesAutoresizingMaskIntoConstraints = false
        order.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        order.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
    }
    
    @objc
    func presentDetailMenuList() {
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuListViewVC") as! MenuListViewController
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
}
