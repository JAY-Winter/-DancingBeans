//
//  OptionShotViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/07.
//

import UIKit

class OptionShotViewController: UIViewController {
    @IBOutlet weak var esspressoShotCountLabel: UILabel!
    @IBOutlet weak var esspressoShotCountStepper: UIStepper!

    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ad = UIApplication.shared.delegate as? AppDelegate
    }
    
    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func countEsspressoShotStepper(_ sender: UIStepper) {
        esspressoShotCountLabel.text = Int(sender.value).description
    }
    
    @IBAction func adjustOption(_ sender: Any) {
        let ad = UIApplication.shared.delegate as? AppDelegate

        ad?.shotCountTest = self.esspressoShotCountLabel?.text!
       
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
        
}
