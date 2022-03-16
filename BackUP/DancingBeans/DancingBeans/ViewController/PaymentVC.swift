//
//  PaymentVC.swift
//  Pods
//
//  Created by JAEHYEON on 2022/01/18.
//

import UIKit

class PaymentVC: UIViewController {

    @IBOutlet weak var orderedMenuPrice: UILabel!
    @IBOutlet weak var orderedMenuName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let ud = UserDefaults.standard
        
        if let first = ud.string(forKey: "menuPrice") {
            orderedMenuPrice.text = first
        }
        
        let confirmMenuName = ud.string(forKey: "menuName")
        orderedMenuName.text = confirmMenuName
        
        
        
        

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
