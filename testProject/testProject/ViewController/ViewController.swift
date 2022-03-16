//
//  ViewController.swift
//  testProject
//
//  Created by JAEHYEON on 2022/01/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pressedButton: UIButton!
    @IBAction func pressButton(_ sender: Any) {
        
        let alert = UIAlertController(
            title: "타이틀",
            message: "안녕하세요",
            preferredStyle: .alert
        )
        let ok = UIAlertAction(
            title: "OKtitle",
            style: .default) { action in
            }
        
        alert.addAction(ok)
        present(alert,animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

