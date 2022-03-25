//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/06.
//

import UIKit


class SelectOptionBottomSheetViewController: UIViewController {
    
    let main = MainModel.shared
    
    var menuName: String?
    var shotCount: Int?
    var indexOfOneAndOnly: Int?
    
    
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var shotCountLabel: UILabel?
    @IBOutlet weak var shotOptionButton: UIButton?
    
    
    //-------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuNameLabel.text = menuName
        
        if main.menuInfoInstance.shot == nil {
            self.shotOptionButton?.removeFromSuperview()
            self.shotCountLabel?.removeFromSuperview()
        } else {
            shotCountLabel?.text = "\(shotCount!.description)개"
        }
    }
    
    // MARK: - User actions
    
    @IBAction func selectShot(_ sender: Any) {
        guard let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionShotViewController") as? OptionShotViewController else { return }
        
        AfterVC.delegate = self
        
        AfterVC.sheetPresentationController?.detents = [.medium()]
        
        present(AfterVC, animated: true, completion: nil)
    }
    
    
    @IBAction func confirmOption(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//-----------------------------------------------------------------------------
extension SelectOptionBottomSheetViewController: SelectOptionBottomSheetDelegate {
    func adjustOption(_ vc: UIViewController, value: Int?) {
        shotCountLabel?.text = "\(value!.description)개"
        
        main.menuInfoInstance.shot = value
    }
}
