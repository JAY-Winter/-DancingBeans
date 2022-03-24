import UIKit

class SelectOptionViewController: UIViewController, PayTableDelegate {
    
    private var calculate: CalculateModel = CalculateModel()
    let main = MainModel.shared
    
    var delegate: SelectOptionDelegate?
    var menuName: String = ""
    var menuPrice: Int = 0
    var menuImage: UIImage!
    var indexOfOneAndOnlyGetWay: Int?
    var indexOfOneAndOnlyTemp: Int?
    
    @IBOutlet weak var optionMenuNameLabel: UILabel!
    @IBOutlet weak var optionMenuPriceLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuCountStepper: UIStepper!
    @IBOutlet weak var menuCountNumberLabel: UILabel!
    @IBOutlet weak var menuCountPriceLabel: UILabel!
    @IBOutlet var hereOrToGo: [UIButton]!
    @IBOutlet var hotOrIce: [UIButton]!
    
    //-------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        optionMenuNameLabel.text = menuName
        optionMenuPriceLabel.text = ("\(menuPrice) 원")
        
        menuCountNumberLabel.text = "1"
        menuCountPriceLabel.text = ("\(menuPrice) 원")
        
        menuImageView.image = menuImage
        
        menuCountStepper.wraps = true
        menuCountStepper.autorepeat = true
        menuCountStepper.minimumValue = 1
        menuCountStepper.maximumValue = 30
        
        if main.menuInfoInstance.temp == "OnlyIce" {
            self.hotOrIce[0].removeFromSuperview()
            self.hotOrIce[1].isSelected = true
            self.hotOrIce[1].isEnabled = false
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        main.initMenuInfoInstance()
    }
    
    // MARK: - User actions
    
    @IBAction func menuCountNumberStepper(_ sender: UIStepper) {
        menuCountNumberLabel.text = Int(sender.value).description
        
        if let menuCount = menuCountNumberLabel {
            calculate.setPrice(sender: sender, menuPrice: menuPrice)
            
            menuCountPriceLabel.text = "\(calculate.result) 원"
        }
    }
    
    @IBAction func openSelectOptionBottomSheeet() {
        let SelectOptionBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "SelectOptionBottomSheetViewController") as! SelectOptionBottomSheetViewController
        
        SelectOptionBottomSheetVC.menuName = menuName
        
        if let boolShot = main.menuInfoInstance.shot {
            SelectOptionBottomSheetVC.shotCount = boolShot
        }
        if let sheet = SelectOptionBottomSheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        present(SelectOptionBottomSheetVC, animated: true, completion: nil)
    }
    
    @IBAction func selectGetWay(_ sender: UIButton) {
        if indexOfOneAndOnlyGetWay != nil {
            if !sender.isSelected {
                for index in hereOrToGo.indices {
                    hereOrToGo[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnlyGetWay = hereOrToGo.firstIndex(of: sender)
            } else {
                sender.isSelected = false
                indexOfOneAndOnlyGetWay = nil
                main.menuInfoInstance.getWay = nil
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyGetWay = hereOrToGo.firstIndex(of: sender)
            main.menuInfoInstance.getWay = sender.titleLabel?.text!
        }
    }
    
    @IBAction func selectTemp(_ sender: UIButton) {
        if indexOfOneAndOnlyTemp != nil {
            if !sender.isSelected {
                for index in hotOrIce.indices {
                    hotOrIce[index].isSelected = false
                }
                sender.isSelected = true
                indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            } else {
                sender.isSelected = false
                indexOfOneAndOnlyTemp = nil
                main.menuInfoInstance.temp = nil
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            main.menuInfoInstance.temp = sender.titleLabel?.text!
        }
        if indexOfOneAndOnlyTemp == 0 {
            menuImageView.image = UIImage(named: "americano_hot")
        } else if indexOfOneAndOnlyTemp == 1 {
            menuImageView.image = UIImage(named: "americano_ice")
        } else {
            menuImageView.image = menuImage
        }
    }
    
    @IBAction func addMenuCartButtonTapped(_ sender: UIButton) {
        if let checkGetWay = main.menuInfoInstance.getWay, let checkTemp = main.menuInfoInstance.temp {
            main.addedMenuList.append(main.menuInfoInstance)
            
            alarmCartIsFilled(itemCount: Value.sharedInstance().globalCountInt)
            // "선택한 음료 담기" 클릭 시 alert 뜸
        } else {
            if main.menuInfoInstance.getWay == nil, main.menuInfoInstance.temp == nil {
                main.setErrorMessage(errorCase: "옵션")
                occurErrorAlert(errorMessage: main.errorMessage)
            }
            if main.menuInfoInstance.getWay == nil, main.menuInfoInstance.temp != nil {
                main.setErrorMessage(errorCase: "포장/매장")
                occurErrorAlert(errorMessage: main.errorMessage)
            }
            if main.menuInfoInstance.getWay != nil, main.menuInfoInstance.temp == nil {
                main.setErrorMessage(errorCase: "핫/아이스")
                occurErrorAlert(errorMessage: main.errorMessage)
            }
        }
    }
    
    // MARK: - Methods
    
    func alarmCartIsFilled(itemCount: Int) {
        let alertVC = UIAlertController(title: "장바구니 확인", message: "장바구니에 상품이 추가되었습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)})
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    func occurErrorAlert(errorMessage: String) {
        let alertVC = UIAlertController(title: "확인해주세요!", message: errorMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
}








