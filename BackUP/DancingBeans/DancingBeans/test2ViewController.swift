//
//  test2ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/10.
//

import UIKit

class test2ViewController: UIViewController, testDelegate {
    
    func testFunc() {
        
    }
    
    
    

    

    @IBOutlet weak var test2Label: UILabel!
    
    func testAction() {

        let ad = UIApplication.shared.delegate as? AppDelegate
        
        ad?.shotCountTest = self.test2Label.text
        
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func adjustOption(_ sender: Any) {
//        adjustOption()
        testAction()
    }
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    var text: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = text
        print("test2 viewDidLoad")
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
