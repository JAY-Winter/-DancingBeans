import UIKit
import CloudKit

class SelectOptionViewController: UIViewController, PayTableDelegate {
    // MARK: - variables
    private var delegate                    : SelectOptionDelegate?
    private let menuInstance                = MenuInfo.shared
    private let calculateInstance           = CalculateModel.shared
    private let actionInstance              = ActionModel()
    private let uiModel                     = UIModel()
    private var indexOfOneAndOnlyGetWay     : Int?
    private var indexOfOneAndOnlyTemp       : Int?
    private var menuImageView               = UIImageView()
    private lazy var addMenuToCartButton    : UIButton! = self.uiModel.setSelectButton(buttonTitle: "담기", buttonWidth: 150, buttonHeight: 50)
    private lazy var setPersonalOptionButton: UIButton! = self.uiModel.setSelectButton(buttonTitle: "Personal Option", buttonWidth: 100, buttonHeight: 30)
    private var countStepper                = UIStepper()
    private var menuKrNameLabel             = UILabel()
    private var defaultMenuNameLabel        = UILabel()
    private var defaultMenuPriceLabel       = UILabel()
    private var countedNumberLabel          = UILabel()
    private var countedPriceLabel           = UILabel()
    private lazy var menuNameLine           : UILabel! = self.uiModel.setColoredThinLine(setColor: "black", view: self.view)
    private lazy var steeperLine            : UILabel! = self.uiModel.setColoredThinLine(setColor: "black", view: self.view)
    
    var menuImage         = UIImage()
    var defaultMenuEngName: String!
    var defaultMenuKrName : String!
    var defaultMenuPrice  : Int!
    
    // MARK: - viewDidLoad
    
    @IBOutlet var hotOrIce            : [UIButton]!
    @IBOutlet var hereOrToGo          : [UIButton]!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - User actions
    
    func setView() {

        self.menuImageView.image = menuImage
        
        self.defaultMenuNameLabel.text = menuInstance.menuInfoStructureInstance.name
        self.defaultMenuPriceLabel.text = calculateInstance.setDecimalWon(value: menuInstance.menuInfoStructureInstance.price)
        
        self.menuKrNameLabel.text = defaultMenuKrName
        self.menuKrNameLabel.font = UIFont(name: "Gill Sans", size: 15)
        
        self.countStepper = setCountStepper(stepper: countStepper, min: 1, max: 30)
        self.countStepper.translatesAutoresizingMaskIntoConstraints = false
        self.countStepper.addTarget(self, action: #selector(calculateCountedPrice(_:)), for: .valueChanged)
        
        self.countedNumberLabel.text = "\(String(menuInstance.menuInfoStructureInstance.count))잔"
        self.countedPriceLabel.text = calculateInstance.setDecimalWon(value: menuInstance.menuInfoStructureInstance.price)
        
        self.addMenuToCartButton.addTarget(self, action: #selector(addMenuToCart), for: .touchUpInside)
        self.setPersonalOptionButton.addTarget(self, action: #selector(openSelectOptionBottomSheeet), for: .touchUpInside)
        
        view.addSubview(menuImageView)
        view.addSubview(defaultMenuNameLabel)
        view.addSubview(defaultMenuPriceLabel)
        view.addSubview(menuNameLine)
        view.addSubview(addMenuToCartButton)
        view.addSubview(setPersonalOptionButton)
        view.addSubview(menuKrNameLabel)
        view.addSubview(countStepper)
        view.addSubview(countedPriceLabel)
        view.addSubview(countedNumberLabel)
        // view.addSubview(menuNameLine)
        // view.addSubview(steeperLine)
        
        menuImageView.translatesAutoresizingMaskIntoConstraints           = false
        defaultMenuNameLabel.translatesAutoresizingMaskIntoConstraints    = false
        menuKrNameLabel.translatesAutoresizingMaskIntoConstraints         = false
        defaultMenuPriceLabel.translatesAutoresizingMaskIntoConstraints   = false
        hotOrIce[0].translatesAutoresizingMaskIntoConstraints             = false
        hotOrIce[1].translatesAutoresizingMaskIntoConstraints             = false
        hereOrToGo[0].translatesAutoresizingMaskIntoConstraints           = false
        hereOrToGo[1].translatesAutoresizingMaskIntoConstraints           = false
        setPersonalOptionButton.translatesAutoresizingMaskIntoConstraints = false
        countedNumberLabel.translatesAutoresizingMaskIntoConstraints      = false
        countedPriceLabel.translatesAutoresizingMaskIntoConstraints       = false
        addMenuToCartButton.translatesAutoresizingMaskIntoConstraints     = false
        setPersonalOptionButton.translatesAutoresizingMaskIntoConstraints = false
        // menuNameLine.translatesAutoresizingMaskIntoConstraints            = false
        // steeperLine.translatesAutoresizingMaskIntoConstraints             = false
        
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
        
        // addMenuToCartButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        // addMenuToCartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addMenuToCartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addMenuToCartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        setPersonalOptionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        setPersonalOptionButton.bottomAnchor.constraint(equalTo: steeperLine.topAnchor, constant: -10).isActive = true
        
        countStepper.bottomAnchor.constraint(equalTo: addMenuToCartButton.topAnchor, constant: -20).isActive = true
        countStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        countedNumberLabel.bottomAnchor.constraint(equalTo: addMenuToCartButton.topAnchor, constant: -25).isActive = true
        countedNumberLabel.trailingAnchor.constraint(equalTo: countStepper.leadingAnchor, constant: -60).isActive = true
        
        countedPriceLabel.bottomAnchor.constraint(equalTo: addMenuToCartButton.topAnchor, constant: -25).isActive = true
        countedPriceLabel.leadingAnchor.constraint(equalTo: countStepper.trailingAnchor, constant: 60).isActive = true
        
        menuNameLine.topAnchor.constraint(equalTo: menuKrNameLabel.bottomAnchor, constant: 5).isActive = true
        // menuNameLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        // menuNameLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        steeperLine.bottomAnchor.constraint(equalTo: countStepper.topAnchor, constant: -10).isActive = true
        // steeperLine.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        // steeperLine.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
    }
    

    @objc func calculateCountedPrice(_ sender: UIStepper!) {
        let calculatedPrice = calculateInstance.calculateAddedPrice(sender: sender, menuPrice: defaultMenuPrice)
        
        countedNumberLabel.text = "\(Int(sender.value))잔"
        countedPriceLabel.text = calculateInstance.setDecimalWon(value: calculatedPrice)
        
        menuInstance.menuInfoStructureInstance.price = calculatedPrice
        menuInstance.menuInfoStructureInstance.count = Int(sender.value)
    }
    
    
    @objc func openSelectOptionBottomSheeet() {
        let PersonalOptionTableVC = storyboard?.instantiateViewController(withIdentifier: "PersonalOptionTableViewController") as! PersonalOptionTableViewController
        
        PersonalOptionTableVC.menuName = menuInstance.menuInfoStructureInstance.name

        if let boolShot = menuInstance.menuInfoStructureInstance.shot {
            PersonalOptionTableVC.shotCount = boolShot
        }
        
        if let sheet = PersonalOptionTableVC.sheetPresentationController {
            sheet.detents = [.medium()] // 크기
            sheet.largestUndimmedDetentIdentifier = .medium // bottomSheet present 시, 아래 깔려있는 view 안 어두워짐
            sheet.preferredCornerRadius = 20.0 // state of bottomSheet Corner Radius
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false // bottomSheet 만 drag 가능, sheet 자체가 움직이지 않게 만듬
        }
        present(PersonalOptionTableVC, animated: true, completion: nil)
    }
    
    
    @IBAction func selectTemp(_ sender: UIButton) {
        if indexOfOneAndOnlyTemp != nil {
            if !sender.isSelected {
                for index in hotOrIce.indices {
                    hotOrIce[index].isSelected = false
                    menuInstance.menuInfoStructureInstance.temp = sender.titleLabel?.text!
                }
                sender.isSelected = true
                indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyTemp = hotOrIce.firstIndex(of: sender)
            menuInstance.menuInfoStructureInstance.temp = sender.titleLabel?.text!
        }
        
        if indexOfOneAndOnlyTemp == 0 {
            setMenuDetailInfo(tempIndex: 0, menuName: defaultMenuEngName, menuImageView: menuImageView, menuEngLabel: defaultMenuNameLabel, menuKrLabel: menuKrNameLabel)
        } else if indexOfOneAndOnlyTemp == 1 {
            setMenuDetailInfo(tempIndex: 1, menuName: defaultMenuEngName, menuImageView: menuImageView, menuEngLabel: defaultMenuNameLabel, menuKrLabel: menuKrNameLabel)
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
                menuInstance.menuInfoStructureInstance.getWay = nil
            }
        } else {
            sender.isSelected = true
            indexOfOneAndOnlyGetWay = hereOrToGo.firstIndex(of: sender)
            menuInstance.menuInfoStructureInstance.getWay = sender.titleLabel?.text!
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
    
    
    func setMenuDetailInfo(tempIndex: Int, menuName: String, menuImageView: UIImageView, menuEngLabel: UILabel, menuKrLabel: UILabel) {
        
        switch tempIndex {
        case 0 : // hot
            if let img = UIImage(named: ("\(menuName)")) {
                menuImageView.image = img
            } else {
                menuImageView.image = UIImage(named: "Sorry :(")
            }
            menuEngLabel.text = defaultMenuEngName
            menuKrLabel.text = defaultMenuKrName
        case 1 : // ice
            if let img = UIImage(named: ("Iced \(menuName)")) {
                menuImageView.image = img
            } else {
                menuImageView.image = UIImage(named: "Sorry :(")
            }
            menuEngLabel.text = ("Iced \(defaultMenuEngName!)")
            menuKrLabel.text = ("아이스 \(defaultMenuKrName!)")
            menuInstance.menuInfoStructureInstance.name = menuEngLabel.text
            menuInstance.menuInfoStructureInstance.kr = menuKrNameLabel.text
            
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
        if menuInstance.menuInfoStructureInstance.getWay != nil, menuInstance.menuInfoStructureInstance.temp != nil {
            menuInstance.putMenuList.append(menuInstance.menuInfoStructureInstance)
            calculateInstance.result = menuInstance.menuInfoStructureInstance.price!
            
            occurAddedMenuAlert(itemCount: menuInstance.menuInfoStructureInstance.count)
        } else {
            if menuInstance.menuInfoStructureInstance.getWay == nil, menuInstance.menuInfoStructureInstance.temp == nil {
                actionInstance.setErrorMessage(errorCase: "옵션")
                
                occurErrorAlert(errorMessage: actionInstance.errorMessage)
            }
            if menuInstance.menuInfoStructureInstance.getWay == nil, menuInstance.menuInfoStructureInstance.temp != nil {
                actionInstance.setErrorMessage(errorCase: "포장/매장")
                
                occurErrorAlert(errorMessage: actionInstance.errorMessage)
            }
            if menuInstance.menuInfoStructureInstance.getWay != nil, menuInstance.menuInfoStructureInstance.temp == nil {
                actionInstance.setErrorMessage(errorCase: "핫/아이스")
                
                occurErrorAlert(errorMessage: actionInstance.errorMessage)
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
