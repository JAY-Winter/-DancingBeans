import UIKit

class OptionShotViewController: UIViewController {
    
    private let menuInstance = MenuInfo.shared
    var delegate : SelectOptionBottomSheetDelegate?
    var resultShot: Int?

    private var confirmButton = UIButton()
    
    
    
    @IBOutlet weak var esspressoShotCountLabel: UILabel!
    @IBOutlet weak var esspressoShotCountStepper: UIStepper!
    

    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - User actions
    
    func setView() {
        self.confirmButton.setTitle("CHECK", for: .normal)
        self.confirmButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        self.confirmButton.setTitleColor(.white, for: .normal)
        self.confirmButton.backgroundColor = .systemBlue
        self.confirmButton.layer.cornerRadius = 12
        self.confirmButton.addTarget(self, action: #selector(newAdustOption), for: .touchUpInside)
        
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
        esspressoShotCountStepper.value = Double(menuInstance.menuInfoStructureInstance.shot!)
        esspressoShotCountLabel.text = String(menuInstance.menuInfoStructureInstance.shot!)
    }
    
    @IBAction func countEsspressoShotStepper(_ sender: UIStepper) {
        esspressoShotCountLabel.text = String(Int(sender.value))
        
        resultShot = Int(sender.value) // count 후 변한 값
        menuInstance.menuInfoStructureInstance.shot = resultShot
    }

    
    @objc func newAdustOption() {
        if let resultShotEx = resultShot {
            delegate?.adjustOption(self, value: resultShotEx)
            delegate?.sendData(value: resultShotEx)
        } else {
            delegate?.adjustOption(self, value: menuInstance.menuInfoStructureInstance.shot!)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
