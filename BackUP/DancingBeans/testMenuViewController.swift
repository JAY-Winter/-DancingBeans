//
//  testMenuViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import UIKit

class testMenuViewController: UIViewController, CartDelegate {
    
    @IBOutlet weak private var productNameLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        // Do any additional setup after loading the view.
    }
    
    private func setUI() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func alaramCartIsFilled(itemCount: Int) {
        
        let alertVC = UIAlertController(title: "장바구니 확인", message: "장바구니에 \(itemCount)개의 상품이 추가 되었습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
        
    }
    
    @IBAction func cartButtonTapped() {
        
        let testCartVC = storyboard?.instantiateViewController(withIdentifier: "testCartViewController") as! testCartViewController
        testCartVC.delegate = self
        
        
        if let productName = productNameLabel.text,
           let price = priceLabel.text {
            testCartVC.productName = productName
            testCartVC.price = price
        }
        present(testCartVC, animated: true, completion: nil)
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
