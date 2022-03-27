import UIKit

class SelectOptionViewController: UIViewController, PayTableDelegate {
    
    private let main = MainModel.shared
    
    var delegate: SelectOptionDelegate?
    var defaultMenuName: String = ""
    var defaultMenuPrice: Int = 0
    var menuImage: UIImage!
    var menuDescription: String!
    var indexOfOneAndOnlyGetWay: Int?
    var indexOfOneAndOnlyTemp: Int?
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var defaultMenuNameLabel: UILabel!
    @IBOutlet weak var defaultMenuPriceLabel: UILabel!
    @IBOutlet var hotOrIce: [UIButton]!
    @IBOutlet weak var details: UILabel!
    @IBOutlet var hereOrToGo: [UIButton]!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var countedNumberLabel: UILabel!
    @IBOutlet weak var countedPriceLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        defaultMenuNameLabel.text = String(main.menuInfoInstance.name)
        defaultMenuPriceLabel.text = main.setDeciamlWon(value: main.menuInfoInstance.price)
        
        countedNumberLabel.text = "\(String(main.menuInfoInstance.count))잔"
        countedPriceLabel.text = main.setDeciamlWon(value: main.menuInfoInstance.price)
        
        menuImageView.image = menuImage
        details.text = menuDescription
        
        countStepper.wraps = true
        countStepper.autorepeat = true
        countStepper.minimumValue = 1
        countStepper.maximumValue = 30
        
        if main.menuInfoInstance.temp == "ICED ONLY" {
            setSignatureMenuButton(button1: hotOrIce[0], button2: hotOrIce[1])
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        main.initMenuInfoInstance()
    }
    
    // MARK: - User actions
    
    @IBAction func menuCountNumberStepper(_ sender: UIStepper) {
        let calculatedPrice = main.calculateAddedPrice(sender: sender, menuPrice: defaultMenuPrice)
        
        countedNumberLabel.text = "\(Int(sender.value))잔"
        countedPriceLabel.text = main.setDeciamlWon(value: calculatedPrice)
        
        main.menuInfoInstance.price = calculatedPrice
        main.menuInfoInstance.count = Int(sender.value)
    }
    
    
    @IBAction func openSelectOptionBottomSheeet() {
        let SelectOptionBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "SelectOptionBottomSheetViewController") as! SelectOptionBottomSheetViewController
        
        SelectOptionBottomSheetVC.menuName = main.menuInfoInstance.name
        
        if let boolShot = main.menuInfoInstance.shot {
            SelectOptionBottomSheetVC.shotCount = boolShot
        }
        
        if let sheet = SelectOptionBottomSheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        present(SelectOptionBottomSheetVC, animated: true, completion: nil)
    }
    
    
    @IBAction func selectTemp(_ sender: UIButton) {
        if indexOfOneAndOnlyTemp != nil {
            if !sender.isSelected {
                for index in hotOrIce.indices {
                    hotOrIce[index].isSelected = false
                    main.menuInfoInstance.temp = sender.titleLabel?.text!
                }
                sender.isSelected = true
                indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            main.menuInfoInstance.temp = sender.titleLabel?.text!
        }
        
        if indexOfOneAndOnlyTemp == 0 {
            setMenuDetailInfo(tempIndex: 0, menuName: defaultMenuName, menuImageView: menuImageView, menuLabel: defaultMenuNameLabel)
        } else if indexOfOneAndOnlyTemp == 1 {
            setMenuDetailInfo(tempIndex: 1, menuName: defaultMenuName, menuImageView: menuImageView, menuLabel: defaultMenuNameLabel)
        }
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
    
    
    @IBAction func addMenuToCart(_ sender: UIButton) {
        if main.menuInfoInstance.getWay != nil, main.menuInfoInstance.temp != nil {
            main.addedMenuList.append(main.menuInfoInstance)
            
            main.result = main.menuInfoInstance.price!
            
            occurAddedMenuAlert(itemCount: main.addedMenuList.count)
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
    
    func occurAddedMenuAlert(itemCount: Int) {
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
    
    
    func setMenuDetailInfo(tempIndex: Int, menuName: String, menuImageView: UIImageView, menuLabel: UILabel) {
        
        switch tempIndex {
        case 0 : // hot
            if let img = UIImage(named: ("\(menuName)")) {
                menuImageView.image = img
            } else {
                menuImageView.image = UIImage(named: "Sorry :(")
            }
            menuLabel.text = defaultMenuName
            
        case 1 : // ice
            if let img = UIImage(named: ("Iced \(menuName)")) {
                menuImageView.image = img
            } else {
                menuImageView.image = UIImage(named: "Sorry :(")
            }
            menuLabel.text = ("Iced \(defaultMenuName)")
            main.menuInfoInstance.name = menuLabel.text
            
        default :
            break
        }
    }
    
    
    func setSignatureMenuButton(button1: UIButton, button2: UIButton) {
        button1.isHidden = true
        button2.isSelected = true
        button2.isEnabled = false
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        // button2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // button2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // button2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        // button2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        // button2.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // button2.frame = CGRect(x: self.view.centerXAnchor, y: 400, width: 150, height: 30)
        // button2.frame.size = CGSize(width: 120, height: 30)
        
        // button2.frame = CGRect(x: self.view.frame.width/4, y: 400, width: 120, height: 30)
        
        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 12
        button2.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
