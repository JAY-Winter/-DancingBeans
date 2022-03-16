import UIKit

class SelectOptionViewController: UIViewController, PayTableDelegate, SelectOptionBottomSheetDelegate{
    
    func adjustOption() {
    }
    
    
    
    var delegate: SelectOptionDelegate?
    var productName: String = ""
    var productPrice: Int = 0
    var productMenuImage: UIImage? // --- 이전 VC에서 정의할 메뉴 사진
    
    
    @IBOutlet weak var optionMenuNameLabel: UILabel!
    @IBOutlet weak var optionMenuPriceLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuCountStepper: UIStepper!
    @IBOutlet weak var menuCountNumberLabel: UILabel!
    @IBOutlet weak var menuCountPriceLabel: UILabel!

    
    @IBAction func addMenuCartButtonTapped(_ sender: UIButton) {
        // addMenuCartButtonTapped 시 Value file 의 공란의 배열인 globalOrderMenuList 에 self.productName 이 추가된다
        Value.sharedInstance().globalOrderMenuList.append(self.productName)
        // addMenuCartButtonTapped 시 Value file 의 0 으로 정의된 정수타입 globalCountInt 가 +1 된다
        Value.sharedInstance().globalCountInt += 1
        // "선택한 음료 담기" 클릭 시 alert 뜸
        alarmCartIsFilled(itemCount: Value.sharedInstance().globalCountInt)
    }

    
    @IBAction func menuCountNumberStepper(_ sender: UIStepper) {
        let numberFormatter = NumberFormatter()
//        numberFormatter.numberStyle = .decimal
               
        menuCountNumberLabel.text = Int(sender.value).description
        
        let price = numberFormatter.string(from: NSNumber(value: Int(sender.value)*productPrice))

        menuCountPriceLabel.text = "\(price!) 원"
    }
    

    // open Select Option Bottom Sheet & setting delegate
    @IBAction func openSelectOptionBottomSheeet() {
        let SelectOptionBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "SelectOptionBottomSheetViewController") as! SelectOptionBottomSheetViewController
        
        SelectOptionBottomSheetVC.delegate = self
        SelectOptionBottomSheetVC.menuName = productName
        
        if let sheet = SelectOptionBottomSheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
        }
        present(SelectOptionBottomSheetVC, animated: true, completion: nil)
    }
    
    
    func alarmCartIsFilled(itemCount: Int) {
        let alertVC = UIAlertController(title: "장바구니 확인", message: "장바구니에 \(Value.sharedInstance().globalCountInt)개의 상품이 추가되었습니다.", preferredStyle: .alert)
        
        // Parameter {handler} : 사용자가 action 을 취했을 때 일어나는 action
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { (action) in self.dismiss(animated: true, completion: nil)})
        
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
    
        
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
    }
}
