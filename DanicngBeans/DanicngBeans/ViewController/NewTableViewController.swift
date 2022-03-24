//
//  NewTableViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/23.
//

import UIKit

class NewTableViewController: UITableViewCell {

    @IBOutlet weak var tvImageView: UIImageView!
    @IBOutlet weak var tvLabel: UILabel!

    
    let menus = ["A", "B", "C"]
    let images = ["1", "2", "3"]
}

extension NewTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewController", forIndexPath: indexPath) as! NewTableViewController
        
        
        cell.tvLabel.text = menus[indexPath.row]
        cell.tvImageView.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
}
