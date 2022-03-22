import UIKit

class SelectOptionViewController: UIViewController, PayTableDelegate {
    
    private var calculate: CalculateModel = CalculateModel()
    let main = MainModel.shared
    
    var delegate: SelectOptionDelegate?
    var productName: String = ""
    var productPrice: Int = 0
    var productMenuImage: UIImage!
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
        optionMenuNameLabel.text = productName
        optionMenuPriceLabel.text = ("\(productPrice) 원")
        
        menuCountNumberLabel.text = "1"
        menuCountPriceLabel.text = ("\(productPrice) 원")
        
        menuImageView.image = productMenuImage
        
        menuCountStepper.wraps = true
        menuCountStepper.autorepeat = true
        menuCountStepper.minimumValue = 1
        menuCountStepper.maximumValue = 30
        
        if main.menuInfoInstance.temp == "OnlyIce" {
            self.hotOrIce[0].removeFromSuperview()
            print("remove button")
        }
        
        //        if hotOrIce[indexOfOneAndOnlyTemp] == 0 {
        //            print("1")
        //        } else {
        //            print("2")
        //        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("disappear")
        
        main.menuInfoInstance.menuName = nil
        main.menuInfoInstance.menuPrice = nil
        main.menuInfoInstance.menuShot = nil
        main.menuInfoInstance.getWay = nil
        main.menuInfoInstance.temp = nil
        // 여기서 mainModel Instance 메모리 해제되어야함
    }
    
    // MARK: - User actions
    
    
    
    @IBAction func menuCountNumberStepper(_ sender: UIStepper) {
        menuCountNumberLabel.text = Int(sender.value).description
        
        if let menuCount = menuCountNumberLabel {
            calculate.setPrice(sender: sender, menuPrice: productPrice)
            
            menuCountPriceLabel.text = "\(calculate.result) 원"
        }
    }
    
    @IBAction func openSelectOptionBottomSheeet() {
        let SelectOptionBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "SelectOptionBottomSheetViewController") as! SelectOptionBottomSheetViewController
        
        SelectOptionBottomSheetVC.menuName = productName
        
        if let boolShot = main.menuInfoInstance.menuShot {
            SelectOptionBottomSheetVC.shotCount = boolShot
        } else {
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
        } else {
            menuImageView.image = UIImage(named: "americano_ice")
        }
    }
    
    @IBAction func addMenuCartButtonTapped(_ sender: UIButton) {
        // addMenuCartButtonTapped 시 Value file 의 공란의 배열인 globalOrderMenuList 에 self.productName 이 추가된다
        Value.sharedInstance().globalOrderMenuList.append(self.productName)
        // addMenuCartButtonTapped 시 Value file 의 0 으로 정의된 정수타입 globalCountInt 가 +1 된다
        Value.sharedInstance().globalCountInt += 1
        // "선택한 음료 담기" 클릭 시 alert 뜸
        
        if let checkGetWay = main.menuInfoInstance.getWay, let checkTemp = main.menuInfoInstance.temp {
        } else {
            if main.menuInfoInstance.getWay == nil, main.menuInfoInstance.temp == nil{
                occurErrorMessage(errorCode: "옵션")
            }
            if main.menuInfoInstance.getWay == nil {
                occurErrorMessage(errorCode: "포장/매장")
            }
            if main.menuInfoInstance.temp == nil {
                occurErrorMessage(errorCode: "핫/아이스")
            }
            
        }
        alarmCartIsFilled(itemCount: Value.sharedInstance().globalCountInt)
    }
    
    // MARK: - Methods
    
    func alarmCartIsFilled(itemCount: Int) {
        let alertVC = UIAlertController(title: "장바구니 확인", message: "장바구니에 상품이 추가되었습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)})
        
        print("add menu To Cart : \(main.menuInfoInstance)")
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    func occurErrorMessage(errorCode: String) {
        print("occurErrorMessage : \(main.menuInfoInstance)")
        
        var errorMessage: String = ""
        
        switch errorCode {
        case "핫/아이스" : errorMessage = "핫/아이스를 선택해주세요 :)"
        case "포장/매장" : errorMessage = "포장/매장을 선택해주세요 :)"
        default : errorMessage = "옵션을 선택해주세요 :)"
        }
        
        let alertVC = UIAlertController(title: "확인해주세요!", message: errorMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}
