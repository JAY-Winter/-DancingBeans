//
//  test1ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/10.
//

import UIKit

class test1ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var labelTest1: UILabel!
    
    @IBOutlet weak var labelTest111: UILabel!
    @IBOutlet weak var countStepper: UIStepper!
    

    @IBAction func countValue(_ sender: UIStepper) {
        labelTest1.text = Int(sender.value).description
    }
    
    
    @IBAction func tappedNextButton(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "test2ViewControllerID") as? test2ViewController else {return}
        
        
        nextVC.countLabel?.text! = self.labelTest1.text!
        
        print("nextVC.countLabel?.text : \(nextVC.countLabel?.text!)")
        print("self.labelTest1.text : \(self.labelTest1.text!)")
        
        
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test1 viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let testLabel = ad?.shotCountTest {
            labelTest111.text = (testLabel)
        }

    }
}



