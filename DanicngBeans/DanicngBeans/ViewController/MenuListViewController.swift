//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import UIKit

class MenuListViewController: UIViewController{
    
    private var main = MainModel()
    
    @IBOutlet var menuChooseButton: [UIButton]!
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func selectMenuButtonTapped(_ sender: UIButton) {
        
        let SelectOptionVC = storyboard?.instantiateViewController(identifier: "SelectOptionViewController") as! SelectOptionViewController
        
        if let menu = sender.titleLabel?.text! {
            
            main.setCommonMenuInfo(menuName: menu)
            SelectOptionVC.productName = main.menuInfoInstance.menuName
            SelectOptionVC.productPrice = main.menuInfoInstance.menuPrice
            
            if let menuImage = UIImage(named: menu){
                SelectOptionVC.productMenuImage = menuImage
            } else {
                SelectOptionVC.productMenuImage = UIImage(named: "Sorry :(")
            }
            
            self.present(SelectOptionVC, animated: true, completion: nil)
        }
    }
}
