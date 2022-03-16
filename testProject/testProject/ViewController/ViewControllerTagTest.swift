import UIKit

class ViewControllerTagTest: UIViewController {
    
    let label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.frame.size = CGSize(width: 100, height: 50)
        label.text = "Hello, World"
        label.textColor = .black
        label.center = self.view.center
        
        label.tag = 1
                
        self.view.addSubview(label)

    }


    @IBAction func changeText(_ sender: UIButton) {
        
        let label = self.view.viewWithTag(1) as! UILabel
        
        label.text = "test test"
        label.textColor = .blue
    }
    
    
    
}
    
    




