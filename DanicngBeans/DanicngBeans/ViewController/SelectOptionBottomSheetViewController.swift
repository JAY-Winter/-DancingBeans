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
    
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet var shotCountLabel: UILabel?
    
    //--------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuNameLabel.text = menuName
        shotCountLabel?.text = shotCount?.description
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

//--------------------------------------------------------------------------------------------
extension SelectOptionBottomSheetViewController: SelectOptionBottomSheetDelegate {
    func adjustOption(_ vc: UIViewController, value: Int?) {
        shotCountLabel?.text = value?.description

        main.menuInfoInstance.menuShot = value
        main.deinitialize()
    }
}

