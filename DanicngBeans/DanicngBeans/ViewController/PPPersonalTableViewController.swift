//
//  2PersonalTableViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/31.
//

import UIKit

class PPPersonalTableViewController: UIViewController {

    
    private var delegate: PPPersonalTableDelegate?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("count list : \(personalOptionList.count)")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}


// MARK: -

let personalOptionList = ["ESPRESSO SHOT", "ICE", "WATER"]


class personalCustomCell: UITableViewCell {

    
    @IBOutlet weak var optionNameLabel: UILabel!
    var optionName: UILabel! = UILabel()
    

    
}


extension PPPersonalTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalOptionList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! personalCustomCell
        
        
        cell.optionNameLabel.text = personalOptionList[indexPath.row]
        
        
        return cell
    }
    
    
}



