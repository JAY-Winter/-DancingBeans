//
//  ViewController.swift
//  testProject
//
//  Created by JAEHYEON on 2022/01/02.
//

import UIKit

// 1번 VC
class BeforeViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBAction func valueChangeBtn(_ sender: Any) {
        guard let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: String)
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let first = testName {
            testNameLabel.text = first
        }
        
    }
    
    
}

