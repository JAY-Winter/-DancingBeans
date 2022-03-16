import UIKit

class RoundButton: UIButton {
        
    override func draw(_ rect: CGRect) {
        
//        self.clipsToBounds = true
        self.clipsToBounds = true
        self.setTitle("basket", for: .normal)
        self.layer.borderWidth = 1.0
        self.layer.
        self.layer.borderColor = UIColor.yellow.cgColor
        self.backgroundColor = .black
        
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        
    }
    
    
}
