//
//  OptionShotViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/07.
//

import UIKit

class OptionShotViewController: UIViewController, SelectOptionBottomSheetDelegate {

    
    @IBOutlet weak var esspressoShotCountLabel: UILabel!
    @IBOutlet weak var esspressoShotCountStepper: UIStepper!

    @IBAction func countEsspressoShotStepper(_ sender: UIStepper) {
        esspressoShotCountLabel.text = Int(sender.value).description
    }
    
    
    func adjustOption() {
    }
    
    
    
    func testAction() {
        let ad = UIApplication.shared.delegate as? AppDelegate

        ad?.shotCountTest = self.esspressoShotCountLabel?.text!
       
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func adjustOption(_ sender: Any) {
        testAction()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        if let first = ad?.shotCountTest {
//            self.esspressoShotCountLabel.text = first
//        } else {
//            print(" viewDidLoad 될 때 nil 임")
//        }

//        let SelectOptionBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "SelectOptionBottomSheetViewController") as! SelectOptionBottomSheetViewController
//
//        print("여기서. ; \(SelectOptionBottomSheetVC.menuName)")
//        print("여긴 : \(SelectOptionBottomSheetVC.menuNameLabel?.text)")
//
//
//        switch (SelectOptionBottomSheetVC.menuNameLabel?.text) {
//
//        case "Americano" :
//            print("americano 네")
//        default:
//            print(SelectOptionBottomSheetVC.menuName)
//            print("default")
//        }
    }
}
