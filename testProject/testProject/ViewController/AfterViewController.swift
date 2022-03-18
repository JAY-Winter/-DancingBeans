//
//  ViewController.swift
//  testProject
//
//  Created by JAEHYEON on 2022/01/02.
//

import UIKit

// 2번 VC
class AfterViewController: UIViewController {

    var delegate : SendData?
    
    @IBOutlet weak var inputField: UITextField!
        
    @IBAction func ChangeBtn(_ sender: Any) {
        delegate?.send(self, Input: inputField.text)
    
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


}

