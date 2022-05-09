import UIKit


class OptionShotViewController: UIViewController {

    var delegate: SendShotValue?
    private let menuInstance = MenuInfo.shared
    private let uiModel = UIModel()
    
    
    private lazy var confirmButton: UIButton!
        = self.uiModel.setSelectButton(buttonTitle: "적용하기", font: "HelveticaNeue-Bold", fontSize: 15, fontColor: .white, backGroundColor: UIColor(named: "buttonBackGroundColor")!, buttonWidth: 100, buttonHeight: 30, view: self.view)
    
    private lazy var esspressoNameLabel: UILabel!
        = self.uiModel.setLabel(text: "Esspresso Shot", size: 15, view: self.view)
    
    private lazy var esspressoShotCountStepper: UIStepper!
        = self.uiModel.setStepper(min: 1, max: 6, view: self.view)
    
    private lazy var esspressoShotCountLabel: UILabel!
        = self.uiModel.setLabel(text: String(menuInstance.menuInfoStructureInstance.shot!), size: 15, view: self.view)

    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutuLayout()
        setFunction()
    }
    
    // MARK: - User actions
    
    func setAutuLayout() {
        esspressoNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        esspressoNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        esspressoShotCountStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        esspressoShotCountStepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        esspressoShotCountLabel.leadingAnchor.constraint(equalTo: esspressoShotCountStepper.trailingAnchor, constant: 60).isActive = true
        esspressoShotCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    
    func setFunction() {
        self.confirmButton.addTarget(self, action: #selector(adjustNewOption), for: .touchUpInside)
        
        self.esspressoShotCountStepper.wraps = false
        self.esspressoShotCountStepper.isContinuous = false
        self.esspressoShotCountStepper.value = Double(menuInstance.menuInfoStructureInstance.shot!)
        self.esspressoShotCountStepper.addTarget(self, action: #selector(countEsspressoShotStepper(_:)), for: .touchUpInside)
    }
    
    
    @objc func countEsspressoShotStepper(_ sender: UIStepper) {
        esspressoShotCountLabel.text = String(Int(sender.value))
    }
    
    
    @objc func adjustNewOption() {
        menuInstance.menuInfoStructureInstance.shot = Int(self.esspressoShotCountStepper.value)

        delegate?.sendShotValueAndReloadData(data: menuInstance.menuInfoStructureInstance.shot!)

        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
