
import UIKit
//import MaterialComponents.MaterialBottomSheet // --- Bottom Sheet Library


class SecondMenuViewController: UIViewController {

   
    
    // var

    var menuName: String?   // --- 이전 VC에서 정의할 메뉴 이름
    var menuImage: UIImage? // --- 이전 VC에서 정의할 메뉴 사진
    var menuPrice: Int = 0  // --- 이전 VC에서 정의할 메뉴 가격
    var menuOptionTemp: UILabel?
    
    
    // IBOutlet
    
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuCountNumberLabel: UILabel!
    @IBOutlet weak var menuCountStepper: UIStepper!
    @IBOutlet weak var menuOrderPrice: UILabel!
    @IBOutlet weak var menuOptionHot: UIButton!
    @IBOutlet weak var menuOptionIce: UIButton!
    
    let ud = UserDefaults.standard
    // 메뉴 개수 및 가격 count func
    @IBAction func menuCountNumberStepper(_ sender: UIStepper) {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let price = numberFormatter.string(from: NSNumber(value: Int(sender.value) * menuPrice))
        print(price)
        
        menuCountNumberLabel.text = Int(sender.value).description
        menuOrderPrice.text = " \(price!) 원"
    }

     
    @IBAction func switchHotMenu(_ sender: Any) {
        
        print("choose Hot menu")
        
        switch (self.menuName) {
            
        case "Iced Americano":
            
            self.menuImageView.image = UIImage(named: "americano_hot")
            self.menuNameLabel.text = "Americano"
            
        case "Latte" :
            
            self.menuImageView.image = UIImage(named: "latte_hot")
            self.menuNameLabel.text = "Latte"
            
        default :
            
            print("default")
        }
    }
    
    
    @IBAction func switchIceMenu(_ sender: Any) {
        
        print("choose Ice menu")
        
//        self.menuImageView.image = UIImage(named: "americano_ice")
        
        switch (self.menuName) {
            
        case "Iced Americano":
            
            self.menuImageView.image = UIImage(named: "americano_ice")
            self.menuNameLabel.text = "Iced Americano"
          
        case "Latte" :
            
            self.menuImageView.image = UIImage(named: "latte_ice")
            self.menuNameLabel.text = "Iced Latte"
            
        default :
            
            print("default")
        }
        
    }
    
    
    // 담기 버튼 action
    @IBAction func backToMain() {
//        self.dismiss(animated: true, completion: nil) // --- modal.dismiss
        print("담기 클릭")
        
        self.ud.set(self.menuOrderPrice.text, forKey: "menuPrice")
        self.ud.set(self.menuNameLabel.text, forKey: "menuName")

        self.navigationController?.popViewController(animated: true) // --- navigation pop
        
    }


    // view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuCountStepper.wraps = true
        menuCountStepper.autorepeat = true
        menuCountStepper.minimumValue = 1
        menuCountStepper.maximumValue = 30
        
        self.menuOrderPrice.text? = " \(menuPrice)  원"
            
            }
    
    // 이전 VC 에서 받아 appear 할 property
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        menuNameLabel.text = menuName
        menuImageView.image = menuImage
        
    }
    

}
