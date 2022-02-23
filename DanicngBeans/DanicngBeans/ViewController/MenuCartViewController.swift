//
//  cartMenuViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/26.
//

import UIKit

class MenuCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        cartMenuNameLabel.text = cartMenuName
        cartMenuPriceLabel.text = cartMenuPrice
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            
        case 0:

            return Value.sharedInstance().globalCountInt
            // Value.swift 에서 선언한 globalCountInt 전역변수를 이용해서 count > SelectOptionViewController - addMenuCartButtonTapped 누를 때 마다 count +1
            // n개 이상시 스크롤 가능
        default:
//            imageView.image = UIImage(named: "Sorry :(") // SelectOptionViewController - addMenuCartButtonTapped 클릭되지 않았을 때. 즉, 어떤 메뉴도 추가되지 않았을 때 장바구니에 기본적으로 떠야하는 이미지를 넣으려고 했음
            return 1

        }

    }
    


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!

    
    let cellIdentifier: String = "cell"


    // 아래 두 개의 func 는 PayTableViewController 참고
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1    // section 수는 일단 1개로 선언
    }
    
    var cartMenuName: String = ""
    var cartMenuPrice: String = ""
        
    @IBOutlet weak var cartMenuNameLabel: UILabel!
    @IBOutlet weak var cartMenuPriceLabel: UILabel!

    func setUI() {
        navigationController?.navigationBar.isHidden = true
        
    }
    

}

