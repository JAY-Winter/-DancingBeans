//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import UIKit

class MenuListViewController: UIViewController, SelectOptionDelegate{
    
    private var main = MainModel()
    
    @IBOutlet var menuChooseButton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    // (3) 프로토콜의 메서드를 구현한 부분 / 현재는 필요 없음
    func alarmCartIsFilled(itemCount: Int) {
        
    }
    
    
    @IBAction func selectMenuButtonTapped(_ sender: UIButton) {
        
        let SelectOptionVC = storyboard?.instantiateViewController(identifier: "SelectOptionViewController") as! SelectOptionViewController
        SelectOptionVC.delegate = self // (2) SelectOptionVC의 권한 대신함
        
        
        if let menu = sender.titleLabel?.text! {
            
            main.setCommonMenuInfo(menuName: menu)
            
            
            SelectOptionVC.productName = menu
            SelectOptionVC.productPrice = main.menuInfo?.menuPrice ?? 0 //menuPrice
            SelectOptionVC.productMenuImage = UIImage(named: menu)
            
            self.present(SelectOptionVC, animated: true, completion: nil)
        }
        
        
        
    }
}
