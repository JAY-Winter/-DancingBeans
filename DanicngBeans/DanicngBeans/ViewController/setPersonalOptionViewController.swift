//
//  setPersonalOptionViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/31.
//

import UIKit

class setPersonalOptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: setPersonalOptionDelegate?
    
    
    let list1 = ["a", "b", "c", "d", "e"]
    
    private var tableView: UITableView! = UITableView()
    private var tableViewCell: UITableViewCell! = UITableViewCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentiifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentiifier)
        contentView.addSubview(label)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(tableView)
        self.tableView.addSubview(tableViewCell)
        
        tableViewCell.accessibilityIdentifier = "itisCell"
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list1.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "itiscell", for: indexPath) as! cussCell
        
        cell.nameLabel.text = list1[indexPath.row]
        
        return cell
        
    }
    
    
}

class cussCell: UITableViewCell {
    var nameLabel = UILabel()
}
