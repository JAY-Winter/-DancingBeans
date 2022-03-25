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
    
    //--------------------------------------------------------------------------------------------
    private func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - User actions
    
    @IBAction func selectMenuButtonTapped(_ sender: UIButton) {
        let SelectOptionVC = storyboard?.instantiateViewController(identifier: "SelectOptionViewController") as! SelectOptionViewController

        if let menu = sender.titleLabel?.text! {
            main.setCommonMenuInfo(menuName: menu)
            
            SelectOptionVC.menuName = main.menuInfoInstance.name
            SelectOptionVC.menuPrice = main.menuInfoInstance.price
            
            if let menuImage = UIImage(named: menu) {
                SelectOptionVC.menuImage = menuImage
            } else {
                SelectOptionVC.menuImage = UIImage(named: "Sorry :(")
            }
            self.present(SelectOptionVC, animated: true, completion: nil)
        }
    }
}
