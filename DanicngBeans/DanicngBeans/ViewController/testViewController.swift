//  Created by JAEHYEON on 2022/03/28.

import UIKit

class testViewController: UIViewController {
    
    var coffee: UILabel!
    var noncoffee: UILabel!
    var filter: UILabel!
    var dessert: UILabel!
    var order: UILabel!
    
    var coffee2: UILabel!
    var noncoffee2: UILabel!
    var filter2: UILabel!
    var dessert2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffee = UILabel()
        coffee.text = "COFFEE"
        coffee.font = UIFont(name: "Gill Sans Bold", size: 30)
        coffee.font = UIFont.preferredFont(forTextStyle: .body)
        coffee.adjustsFontForContentSizeCategory = true
        coffee.textColor = .black
        
        
        noncoffee = UILabel()
        noncoffee.text = "NON COFFEE"
        noncoffee.font = UIFont(name: "Gill Sans Bold", size: 30)
        noncoffee.font = UIFont.preferredFont(forTextStyle: .body)
        noncoffee.adjustsFontForContentSizeCategory = true
        noncoffee.textColor = .black
        
        
        filter = UILabel()
        filter.text = "FILTER"
        filter.font = UIFont(name: "Gill Sans Bold", size: 30)
        filter.textColor = .black
        
        
        dessert = UILabel()
        dessert.text = "DESSERT"
        dessert.font = UIFont(name: "Gill Sans Bold", size: 30)
        dessert.textColor = .black

        
        order = UILabel()
        order.text = "ORDER"
        order.font = UIFont(name: "Gill Sans Bold", size: 25)
        order.textColor = .black
        order.backgroundColor = UIColor.systemGray.withAlphaComponent(0.1)
        
        
        
        
        coffee2 = UILabel()
        coffee2.text = "                      "
        coffee2.backgroundColor = .systemBrown

        
        noncoffee2 = UILabel()
        noncoffee2.text = "                   "
        noncoffee2.font = UIFont(name: "Gill Sans Bold", size: 30)
        noncoffee2.backgroundColor = .systemCyan
        
        
        filter2 = UILabel()
        filter2.text = "                      "
        filter2.font = UIFont(name: "Gill Sans Bold", size: 30)
        filter2.backgroundColor = .systemMint
        
        
        dessert2 = UILabel()
        dessert2.text = "                    "
        dessert2.font = UIFont(name: "Gill Sans Bold", size: 30)
        dessert2.backgroundColor = .systemTeal

        
        view.addSubview(coffee)
        view.addSubview(noncoffee)
        view.addSubview(filter)
        view.addSubview(dessert)
        view.addSubview(order)
        view.addSubview(coffee2)
        view.addSubview(noncoffee2)
        view.addSubview(filter2)
        view.addSubview(dessert2)

        
        coffee.translatesAutoresizingMaskIntoConstraints = false
        coffee.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        coffee.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        noncoffee.translatesAutoresizingMaskIntoConstraints = false
        noncoffee.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        noncoffee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        filter.translatesAutoresizingMaskIntoConstraints = false
        filter.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        filter.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        dessert.translatesAutoresizingMaskIntoConstraints = false
        dessert.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        dessert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
       
        order.translatesAutoresizingMaskIntoConstraints = false
        order.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        order.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        coffee2.translatesAutoresizingMaskIntoConstraints = false
        coffee2.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        coffee2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        noncoffee2.translatesAutoresizingMaskIntoConstraints = false
        noncoffee2.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        noncoffee2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        filter2.translatesAutoresizingMaskIntoConstraints = false
        filter2.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        filter2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        dessert2.translatesAutoresizingMaskIntoConstraints = false
        dessert2.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        dessert2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
