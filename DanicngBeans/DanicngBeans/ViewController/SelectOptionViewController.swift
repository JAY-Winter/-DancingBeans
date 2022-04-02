import UIKit
import CloudKit

class SelectOptionViewController: UIViewController, PayTableDelegate {
    private let main = ActionModel()
    private let menuInstance = MenuInfo.shared
    
    var delegate: SelectOptionDelegate?
    var menuImage: UIImage!
    var defaultMenuEngName: String = ""
    var defaultMenuKrName: String = ""
    var defaultMenuPrice: Int = 0
    var menuKrName = ""
    var menuDescription: String!
    var indexOfOneAndOnlyGetWay: Int?
    var indexOfOneAndOnlyTemp: Int?
    
    @IBOutlet var hotOrIce: [UIButton]!
    @IBOutlet var hereOrToGo: [UIButton]!
    @IBOutlet weak var setOptionButton: UIButton!
    
    private var menuKrNameLabel = UILabel()
    private var menuImageView = UIImageView()
    private var defaultMenuNameLabel = UILabel()
    private var secondView = UIView()
    private var defaultMenuPriceLabel = UILabel()
    private var addMenuToCartButton: UIButton!
    
    private var countedNumberLabel = UILabel()
    private var countedPriceLabel = UILabel()
    private var countStepper: UIStepper! = UIStepper()
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let menuNameLine = setColoredThinLine(setColor: "black")
        let steeperLine = setColoredThinLine(setColor: "black")
        
        menuImageView.image = menuImage
        
        defaultMenuNameLabel.text = menuInstance.name
        defaultMenuPriceLabel.text = main.setDeciamlWon(value: menuInstance.price)
        
        menuKrNameLabel.text = menuKrName
        menuKrNameLabel.font = UIFont(name: "Gill Sans", size: 15)
        
        let countStepper2 = setCountStepper(stepper: countStepper, min: 1, max: 30)
        countStepper2.translatesAutoresizingMaskIntoConstraints = false
        countStepper2.addTarget(self, action: #selector(calculateCountedPrice(_:)), for: .valueChanged)

        countedNumberLabel.text = "\(String(menuInstance.count))잔"
        countedPriceLabel.text = main.setDeciamlWon(value: menuInstance.price)
        
        addMenuToCartButton = UIButton(type: .system)
        addMenuToCartButton.setTitle("PUT", for: .normal)
        addMenuToCartButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        addMenuToCartButton.setTitleColor(.white, for: .normal)
        addMenuToCartButton.backgroundColor = .systemBlue
        addMenuToCartButton.addTarget(self, action: #selector(addMenuToCart), for: .touchUpInside)
                
        view.addSubview(menuImageView)
        view.addSubview(defaultMenuNameLabel)
        view.addSubview(defaultMenuPriceLabel)
        view.addSubview(menuNameLine)
        view.addSubview(addMenuToCartButton)
        view.addSubview(menuKrNameLabel)
        view.addSubview(countStepper2)
        view.addSubview(countedPriceLabel)
        view.addSubview(countedNumberLabel)
        
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        defaultMenuNameLabel.translatesAutoresizingMaskIntoConstraints = false
        menuKrNameLabel.translatesAutoresizingMaskIntoConstraints = false
        defaultMenuPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        hotOrIce[0].translatesAutoresizingMaskIntoConstraints = false
        hotOrIce[1].translatesAutoresizingMaskIntoConstraints = false
        hereOrToGo[0].translatesAutoresizingMaskIntoConstraints = false
        hereOrToGo[1].translatesAutoresizingMaskIntoConstraints = false
        setOptionButton.translatesAutoresizingMaskIntoConstraints = false
        countedNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        countedPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        addMenuToCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        menuImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        menuImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        menuImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        menuImageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -self.view.frame.height/2).isActive = true
        
        defaultMenuNameLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 15).isActive = true
        defaultMenuNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        defaultMenuPriceLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 15).isActive = true
        defaultMenuPriceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        menuKrNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        menuKrNameLabel.topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 40).isActive = true
        
        hotOrIce[0].topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 70).isActive = true
        hotOrIce[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        hotOrIce[1].topAnchor.constraint(equalTo: menuImageView.bottomAnchor, constant: 70).isActive = true
        hotOrIce[1].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        
        hereOrToGo[0].bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
        hereOrToGo[0].leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        hereOrToGo[1].bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
        hereOrToGo[1].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        
        setOptionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        setOptionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        
        addMenuToCartButton.layer.cornerRadius = 12
        addMenuToCartButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        addMenuToCartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addMenuToCartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addMenuToCartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true

        countStepper2.bottomAnchor.constraint(equalTo: addMenuToCartButton.topAnchor, constant: -20).isActive = true
        countStepper2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        countedNumberLabel.bottomAnchor.constraint(equalTo: addMenuToCartButton.topAnchor, constant: -25).isActive = true
        countedNumberLabel.trailingAnchor.constraint(equalTo: countStepper2.leadingAnchor, constant: -60).isActive = true
        
        countedPriceLabel.bottomAnchor.constraint(equalTo: addMenuToCartButton.topAnchor, constant: -25).isActive = true
        countedPriceLabel.leadingAnchor.constraint(equalTo: countStepper2.trailingAnchor, constant: 60).isActive = true
        
        menuNameLine.topAnchor.constraint(equalTo: menuKrNameLabel.bottomAnchor, constant: 5).isActive = true
        steeperLine.bottomAnchor.constraint(equalTo: countStepper2.topAnchor, constant: -10).isActive = true
        }
    
    // MARK: - User actions

    @objc func calculateCountedPrice(_ sender: UIStepper!) {
        let calculatedPrice = main.calculateAddedPrice(sender: sender, menuPrice: defaultMenuPrice)
        
        countedNumberLabel.text = "\(Int(sender.value))잔"
        countedPriceLabel.text = main.setDeciamlWon(value: calculatedPrice)
        
        menuInstance.price = calculatedPrice
        menuInstance.count = Int(sender.value)
    }
    
    
    @IBAction func openSelectOptionBottomSheeet() {
        let SelectOptionBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "PersonalOptionTableViewController") as! PersonalOptionTableViewController
        
        SelectOptionBottomSheetVC.menuName = menuInstance.name
        
        if let boolShot = menuInstance.shot {
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
                    menuInstance.temp = sender.titleLabel?.text!
                }
                sender.isSelected = true
                indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            menuInstance.temp = sender.titleLabel?.text!
        }
        
        if indexOfOneAndOnlyTemp == 0 {
            setMenuDetailInfo(tempIndex: 0, menuName: defaultMenuEngName, menuImageView: menuImageView, menuLabel: defaultMenuNameLabel)
        } else if indexOfOneAndOnlyTemp == 1 {
            setMenuDetailInfo(tempIndex: 1, menuName: defaultMenuEngName, menuImageView: menuImageView, menuLabel: defaultMenuNameLabel)
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
                menuInstance.getWay = nil
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyGetWay = hereOrToGo.firstIndex(of: sender)
            menuInstance.getWay = sender.titleLabel?.text!
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

extension SelectOptionViewController {
    
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
            menuLabel.text = defaultMenuEngName
            menuKrNameLabel.text = defaultMenuKrName
        case 1 : // ice
            if let img = UIImage(named: ("Iced \(menuName)")) {
                menuImageView.image = img
            } else {
                menuImageView.image = UIImage(named: "Sorry :(")
            }
            menuLabel.text = ("Iced \(defaultMenuEngName)")
            menuKrNameLabel.text = ("아이스 \(defaultMenuKrName)")
            menuInstance.kr = menuKrNameLabel.text
            
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
    
    
    func setColoredThinLine(setColor: String) -> UILabel {
        let line = UILabel()
        line.text = " "
        line.font = UIFont(name: "HelveticaNeue-Bold", size: 1)
        line.backgroundColor = UIColor(named: setColor)
        
        self.view.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        line.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        return line
    }
    
    
    func setCountStepper(stepper: UIStepper,min: Int, max: Int) -> UIStepper {
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 30
        
        return stepper
    }
    
    
    @objc func addMenuToCart() {
        if menuInstance.getWay != nil, menuInstance.temp != nil {
            // main.addedMenuList.append(main.menuInfoInstance)
            menuInstance.putMenuList.append(menuInstance)
            
            
            main.result = menuInstance.price!
            
            occurAddedMenuAlert(itemCount: menuInstance.count)
        } else {
            if menuInstance.getWay == nil, menuInstance.temp == nil {
                main.setErrorMessage(errorCase: "옵션")
                
                occurErrorAlert(errorMessage: main.errorMessage)
            }
            if menuInstance.getWay == nil, menuInstance.temp != nil {
                main.setErrorMessage(errorCase: "포장/매장")
                
                occurErrorAlert(errorMessage: main.errorMessage)
            }
            if menuInstance.getWay != nil, menuInstance.temp == nil {
                main.setErrorMessage(errorCase: "핫/아이스")
                
                occurErrorAlert(errorMessage: main.errorMessage)
            }
        }
    }
}


class testView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.lineWidth = 1
        path.move(to: CGPoint(x: 10, y: self.frame.height/2))
        path.addLine(to: CGPoint(x: self.frame.width-10, y: self.frame.height/2))
        path.close()
        path.stroke()
    }
}
