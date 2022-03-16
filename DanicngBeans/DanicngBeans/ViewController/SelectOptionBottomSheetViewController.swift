//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/06.
//

import UIKit


class SelectOptionBottomSheetViewController: UIViewController {
    var menuName: String?
    var shotCount: String?
    
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet var shotCountLabel: UILabel!
    
    //-------------------------------------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuNameLabel.text = self.menuName
        shotCountLabel.text = "Esspresso 1shot"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let testLabel = ad?.shotCountTest {
            print("nil 아니네용")
            shotCountLabel.text = ("Esspresso \(testLabel)shot")
        } else {
            print("bottom sheet 일 때 작동하는 지 확인")
        }
    }
    
    // MARK: - User actions
    //-------------------------------------------------------------------------------------------------------------------------------------------
    @IBAction func selectShot(_ sender: Any) {
        let SelectOptionShotBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "OptionShotViewController") as! OptionShotViewController
        
        // bottomsheet 생성
        if let sheet = SelectOptionShotBottomSheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(SelectOptionShotBottomSheetVC, animated: true, completion: nil)
    }
}
