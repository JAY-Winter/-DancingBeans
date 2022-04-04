import UIKit

class OptionShotViewController: UIViewController {
    
    private let menuInstance = MenuInfo.shared
    private var confirmButton = UIButton()
    private var esspressoNameLabel = UILabel()
    private var esspressoShotCountStepper = UIStepper()
    private var esspressoShotCountLabel = UILabel()
    
    var delegate : SelectOptionBottomSheetDelegate?
    var resultShot: Int?
    

    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - User actions
    
    func setView() {

        self.confirmButton.configuration = .plain()
        self.confirmButton.configuration?.title = "Adjust New Option"
        self.confirmButton.contentHorizontalAlignment = .leading
        self.confirmButton.addTarget(self, action: #selector(newAdustOption), for: .touchUpInside)

        self.esspressoShotCountStepper.wraps = false
        self.esspressoShotCountStepper.autorepeat = true
        self.esspressoShotCountStepper.minimumValue = 1
        self.esspressoShotCountStepper.maximumValue = 6
        self.esspressoShotCountStepper.isContinuous = false
        self.esspressoShotCountStepper.value = Double(menuInstance.menuInfoStructureInstance.shot!)
        self.esspressoShotCountStepper.addTarget(self, action: #selector(countEsspressoShotStepper(_:)), for: .touchUpInside)
        
        self.esspressoNameLabel.text = "Esspresso Shot"
        self.esspressoShotCountLabel.text = String(menuInstance.menuInfoStructureInstance.shot!)
        
        
        view.addSubview(confirmButton)
        view.addSubview(esspressoNameLabel)
        view.addSubview(esspressoShotCountStepper)
        view.addSubview(esspressoShotCountLabel)
        
        esspressoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        esspressoShotCountStepper.translatesAutoresizingMaskIntoConstraints = false
        esspressoShotCountLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false

        esspressoNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        esspressoNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        esspressoShotCountStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        esspressoShotCountStepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        // esspressoShotCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        esspressoShotCountLabel.leadingAnchor.constraint(equalTo: esspressoShotCountStepper.trailingAnchor, constant: 60).isActive = true
        esspressoShotCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        confirmButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: esspressoShotCountStepper.bottomAnchor, constant: 50).isActive = true

    }
    
    @objc func countEsspressoShotStepper(_ sender: UIStepper) {
        esspressoShotCountLabel.text = String(Int(sender.value))
        
        resultShot = Int(sender.value) // count 후 변한 값
        menuInstance.menuInfoStructureInstance.shot = resultShot
    }

    
    @objc func newAdustOption() {
        if let resultShotEx = resultShot {
            delegate?.adjustOption(self, value: resultShotEx)
        } else {
            delegate?.adjustOption(self, value: menuInstance.menuInfoStructureInstance.shot!)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
