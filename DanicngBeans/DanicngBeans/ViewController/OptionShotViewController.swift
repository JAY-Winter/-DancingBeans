import UIKit

class OptionShotViewController: UIViewController {
    
    
    let menuInstance = MenuInfo.shared
    
    var delegate : SelectOptionBottomSheetDelegate?
    var resultShot: Int?
    
    @IBOutlet weak var esspressoShotCountLabel: UILabel!
    @IBOutlet weak var esspressoShotCountStepper: UIStepper!
    
    
    
    //--------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let confirmButton = UIButton()
        confirmButton.setTitle("CHECK", for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.layer.cornerRadius = 12
        confirmButton.addTarget(self, action: #selector(newAdustOption), for: .touchUpInside)
        
        view.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true

        esspressoShotCountStepper.wraps = false
        esspressoShotCountStepper.autorepeat = true
        esspressoShotCountStepper.minimumValue = 1
        esspressoShotCountStepper.maximumValue = 6
        esspressoShotCountStepper.isContinuous = false
        esspressoShotCountStepper.value = Double(menuInstance.shot!)

        esspressoShotCountLabel.text = String(menuInstance.shot!)

        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        
        let preVC = self.storyboard?.instantiateViewController(withIdentifier: "PersonalOptionTableViewController") as! PersonalOptionTableViewController
        
        
    }
    
    // MARK: - User actions
    //--------------------------------------------------------------------------------------------
    @IBAction func countEsspressoShotStepper(_ sender: UIStepper) {
        esspressoShotCountLabel.text = String(Int(sender.value))
        
        resultShot = Int(sender.value) // count 후 변한 값
        menuInstance.shot = resultShot
    }

    
    @objc func newAdustOption() {
        if let resultShotEx = resultShot {
            delegate?.adjustOption(self, value: resultShotEx)
            delegate?.sendData(value: resultShotEx)
        } else {
            delegate?.adjustOption(self, value: menuInstance.shot!)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
