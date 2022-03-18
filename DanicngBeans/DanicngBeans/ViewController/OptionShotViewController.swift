import UIKit

class OptionShotViewController: UIViewController {
    
    var delegate : SelectOptionBottomSheetDelegate?
    var resultShot: String?
    
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
        
        resultShot = Int(sender.value).description
    }
    
    @IBAction func adjustOption(_ sender: Any) {
        delegate?.adjustOption(self, value: resultShot)
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
