import UIKit

protocol SendAndReloadProtocol {
    func sendAndReloadData(data: Int)
}

class OptionShotViewController: UIViewController {

    private let menuInstance = MenuInfo.shared
    private let uiModel      = UIModel()
    var delegate             : SendAndReloadProtocol?
    
    private lazy var confirmButton: UIButton!
        = self.uiModel.setSelectButton(buttonTitle: "적용하기", font: "HelveticaNeue-Bold", fontSize: 15, fontColor: .white, backGroundColor: UIColor(named: "buttonBackGroundColor")!, buttonWidth: 100, buttonHeight: 30, view: self.view)
    
    private lazy var esspressoNameLabel        : UILabel!
        = self.uiModel.setLabel(text: "Esspresso Shot", size: 15, view: self.view)
    
    private lazy var esspressoShotCountStepper : UIStepper!
        = self.uiModel.setStepper(min: 1, max: 6, view: self.view)
    
    private var esspressoShotCountLabel   = UILabel()
    
    var resultShot: Int?

    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - User actions
    
    func setView() {
        self.confirmButton.addTarget(self, action: #selector(newNewNewButton), for: .touchUpInside)
        
        self.esspressoShotCountStepper.wraps = false
        self.esspressoShotCountStepper.isContinuous = false
        self.esspressoShotCountStepper.value = Double(menuInstance.menuInfoStructureInstance.shot!)
        self.esspressoShotCountStepper.addTarget(self, action: #selector(countEsspressoShotStepper(_:)), for: .touchUpInside)
        
        self.esspressoShotCountLabel.text = String(menuInstance.menuInfoStructureInstance.shot!)
        
        view.addSubview(esspressoShotCountLabel)
        
        esspressoShotCountLabel.translatesAutoresizingMaskIntoConstraints = false

        esspressoNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        esspressoNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        esspressoShotCountStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        esspressoShotCountStepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        esspressoShotCountLabel.leadingAnchor.constraint(equalTo: esspressoShotCountStepper.trailingAnchor, constant: 60).isActive = true
        esspressoShotCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: esspressoShotCountStepper.bottomAnchor, constant: 50).isActive = true
    }
    
    @objc func countEsspressoShotStepper(_ sender: UIStepper) {
        esspressoShotCountLabel.text = String(Int(sender.value))
        
        resultShot = Int(sender.value) // count 후 변한 값
        menuInstance.menuInfoStructureInstance.shot = resultShot
    }
    
    @objc func newNewNewButton() {
        if let resultShotEx = resultShot {
            delegate?.sendAndReloadData(data: resultShotEx)
        } else {
            delegate?.sendAndReloadData(data: menuInstance.menuInfoStructureInstance.shot!)
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
