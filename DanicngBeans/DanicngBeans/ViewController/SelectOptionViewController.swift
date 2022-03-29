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

    // @IBOutlet weak var details: UILabel!
    @IBOutlet var hotOrIce: [UIButton]!
    @IBOutlet var hereOrToGo: [UIButton]!
    @IBOutlet weak var countStepper: UIStepper!
    @IBOutlet weak var countedNumberLabel: UILabel!
    @IBOutlet weak var countedPriceLabel: UILabel!
    @IBOutlet weak var setOptionButton: UIButton!
    
    private var menuImageView = UIImageView()
    private var defaultMenuNameLabel = UILabel()
    private var secondView = UIView()
    private var defaultMenuPriceLabel = UILabel()
    var addMenuToCartButton: UIButton!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        menuImageView.image = menuImage
        // defaultMenuNameLabel.text = String(main.menuInfoInstance.name)
        defaultMenuNameLabel.text = main.modifiedMenuInfoInstance.name
        print("print: \(main.modifiedMenuInfoInstance.name!)")
        
        // defaultMenuPriceLabel.text = main.setDeciamlWon(value: main.menuInfoInstance.price)
        defaultMenuPriceLabel.text = main.setDeciamlWon(value: main.modifiedMenuInfoInstance.price)
        
        // countedNumberLabel.text = "\(String(main.menuInfoInstance.count))잔"
        countedNumberLabel.text = "\(String(main.modifiedMenuInfoInstance.count))잔"
        // countedPriceLabel.text = main.setDeciamlWon(value: main.menuInfoInstance.price)
        countedPriceLabel.text = main.setDeciamlWon(value: main.modifiedMenuInfoInstance.price)
        
        addMenuToCartButton = UIButton(type: .system)
        addMenuToCartButton.setTitle("PUT", for: .normal)
        addMenuToCartButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        addMenuToCartButton.setTitleColor(.white, for: .normal)
        addMenuToCartButton.backgroundColor = .systemBlue
        
        addMenuToCartButton.addTarget(self, action: #selector(abc), for: .touchUpInside)
        
        countStepper.wraps = true
        countStepper.autorepeat = true
        countStepper.minimumValue = 1
        countStepper.maximumValue = 30
        
        self.view.addSubview(menuImageView)
        self.view.addSubview(defaultMenuNameLabel)
        self.view.addSubview(defaultMenuPriceLabel)
        self.view.addSubview(addMenuToCartButton)
        
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        defaultMenuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        defaultMenuPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        hotOrIce[0].translatesAutoresizingMaskIntoConstraints = false
        hotOrIce[1].translatesAutoresizingMaskIntoConstraints = false
        hereOrToGo[0].translatesAutoresizingMaskIntoConstraints = false
        hereOrToGo[1].translatesAutoresizingMaskIntoConstraints = false
        setOptionButton.translatesAutoresizingMaskIntoConstraints = false
        countStepper.translatesAutoresizingMaskIntoConstraints = false
        countedNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        countedPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        addMenuToCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        menuImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        menuImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        menuImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        menuImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -self.view.frame.height/2).isActive = true
        
        defaultMenuNameLabel.topAnchor.constraint(equalTo: self.menuImageView.bottomAnchor, constant: 15).isActive = true
        defaultMenuNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        defaultMenuPriceLabel.topAnchor.constraint(equalTo: self.menuImageView.bottomAnchor, constant: 15).isActive = true
        defaultMenuPriceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        hotOrIce[0].topAnchor.constraint(equalTo: self.menuImageView.bottomAnchor, constant: 40).isActive = true
        hotOrIce[0].leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        hotOrIce[1].topAnchor.constraint(equalTo: self.menuImageView.bottomAnchor, constant: 40).isActive = true
        hotOrIce[1].trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        
        hereOrToGo[0].bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -190).isActive = true
        hereOrToGo[0].leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        hereOrToGo[1].bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -190).isActive = true
        hereOrToGo[1].trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        
        setOptionButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -150).isActive = true
        setOptionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40).isActive = true
        
        countStepper.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        countStepper.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        countedNumberLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -110).isActive = true
        countedNumberLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60).isActive = true
        
        countedPriceLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -110).isActive = true
        countedPriceLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -60).isActive = true
        
        addMenuToCartButton.layer.cornerRadius = 12
        addMenuToCartButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        addMenuToCartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addMenuToCartButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addMenuToCartButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40).isActive = true
        
        // details.text = menuDescription
        
        if main.modifiedMenuInfoInstance.temp == "ICED ONLY" {
            setSignatureMenuButton(button1: hotOrIce[0], button2: hotOrIce[1], button3: hereOrToGo[0] ,button4:hereOrToGo[1])
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
        
        main.modifiedMenuInfoInstance.price = calculatedPrice
        main.modifiedMenuInfoInstance.count = Int(sender.value)
    }
    
    
    @IBAction func openSelectOptionBottomSheeet() {
        let SelectOptionBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "SelectOptionBottomSheetViewController") as! SelectOptionBottomSheetViewController
        
        SelectOptionBottomSheetVC.menuName = main.modifiedMenuInfoInstance.name
        SelectOptionBottomSheetVC.menuName = main.modifiedMenuInfoInstance.name
        
        if let boolShot = main.modifiedMenuInfoInstance.shot {
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
                    main.modifiedMenuInfoInstance.temp = sender.titleLabel?.text!
                }
                sender.isSelected = true
                indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            main.modifiedMenuInfoInstance.temp = sender.titleLabel?.text!
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
                main.modifiedMenuInfoInstance.getWay = nil
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyGetWay = hereOrToGo.firstIndex(of: sender)
            main.modifiedMenuInfoInstance.getWay = sender.titleLabel?.text!
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
            main.modifiedMenuInfoInstance.name = menuLabel.text
            
        default :
            break
        }
    }
    
    
    func setSignatureMenuButton(button1: UIButton, button2: UIButton, button3: UIButton, button4: UIButton) {
        
        self.view.addSubview(button2)
        self.view.addSubview(button4)
        
        button1.isHidden = true
        button2.isSelected = true
        button2.isEnabled = false
        
        button2.setTitle("ICED ONLY", for: .normal)
        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 12
        button2.layer.borderColor = UIColor.systemBlue.cgColor
        
        button3.isHidden = true
        button4.isSelected = true
        button4.isEnabled = false
        
        button4.setTitle("매장 전용", for: .normal)
        button4.layer.borderWidth = 1
        button4.layer.cornerRadius = 12
        button4.layer.borderColor = UIColor.systemBlue.cgColor
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        
        
        button2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button2.topAnchor.constraint(equalTo: self.menuImageView.bottomAnchor, constant: 40).isActive = true
        button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        button4.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button4.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -190).isActive = true
        button4.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    
    @objc
    func abc() {
        if main.modifiedMenuInfoInstance.getWay != nil, main.modifiedMenuInfoInstance.temp != nil {
            main.addedMenuList.append(main.modifiedMenuInfoInstance)
            
            main.result = main.modifiedMenuInfoInstance.price!
            
            occurAddedMenuAlert(itemCount: main.addedMenuList.count)
        } else {
            if main.modifiedMenuInfoInstance.getWay == nil, main.modifiedMenuInfoInstance.temp == nil {
                main.setErrorMessage(errorCase: "옵션")
                
                occurErrorAlert(errorMessage: main.errorMessage)
            }
            if main.modifiedMenuInfoInstance.getWay == nil, main.modifiedMenuInfoInstance.temp != nil {
                main.setErrorMessage(errorCase: "포장/매장")
                
                occurErrorAlert(errorMessage: main.errorMessage)
            }
            if main.modifiedMenuInfoInstance.getWay != nil, main.modifiedMenuInfoInstance.temp == nil {
                main.setErrorMessage(errorCase: "핫/아이스")
                
                occurErrorAlert(errorMessage: main.errorMessage)
            }
        }
    }
}

// MARK: - Extension

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
