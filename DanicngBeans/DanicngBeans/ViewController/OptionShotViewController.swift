import UIKit

class OptionShotViewController: UIViewController {
    
    let main = MainModel.shared
    var delegate : SelectOptionBottomSheetDelegate?
    var resultShot: Int?
    
    @IBOutlet weak var esspressoShotCountLabel: UILabel!
    @IBOutlet weak var esspressoShotCountStepper: UIStepper!
    
    //--------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        esspressoShotCountStepper.wraps = false
        esspressoShotCountStepper.autorepeat = true
        esspressoShotCountStepper.minimumValue = 1
        esspressoShotCountStepper.maximumValue = 6
        
        esspressoShotCountStepper.isContinuous = false
        
        esspressoShotCountLabel.text = main.menuInfoInstance.menuShot?.description
        
        print("esspresso 기본 샷 : \(main.menuInfoInstance.menuShot?.description)")
        
        esspressoShotCountStepper.value = Double(main.menuInfoInstance.menuShot!)
    }
    
    // MARK: - User actions
    //--------------------------------------------------------------------------------------------
    @IBAction func countEsspressoShotStepper(_ sender: UIStepper) {
        print(" sender.value : \(sender.value)")
        esspressoShotCountLabel.text = Int(sender.value).description
        
        resultShot = Int(sender.value)
    }
    
    @IBAction func adjustOption(_ sender: Any) {
        delegate?.adjustOption(self, value: resultShot)
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
