//
//  testCartViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import UIKit

class testCartViewController: UIViewController {

    var delegate: CartDelegate?
    
    @IBAction func instertCartButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        delegate?.alaramCartIsFilled(itemCount: itemCount)
        
    }
    
    var productName: String = "물건이름"
    var price: String = "물건가격"
    var itemCount: Int = 0
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productItemCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
