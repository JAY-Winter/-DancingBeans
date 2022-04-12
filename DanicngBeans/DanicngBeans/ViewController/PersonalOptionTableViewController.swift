//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/06.
//

import UIKit

class PersonalOptionTableViewController: UIViewController {
    
    private let menuInstance     = MenuInfo.shared
    private let uiModel          = UIModel()
    private var optionList       : Dictionary<String, Any> = [:]
    private var indexOfOneAndOnly: Int?
    
    private lazy var confirmButton: UIButton!
        = self.uiModel.setSelectButton(buttonTitle: "CHECK", font: "HelveticaNeue-Bold", fontSize: 15, fontColor: .white, backGroundColor: UIColor(named: "buttonBackGroundColor")!, buttonWidth: 100, buttonHeight: 30, view: self.view)
    
    private lazy var menuNameLine: UILabel!
        = self.uiModel.setColoredThinLine(setColor: "black", view: self.view)
    
    private lazy var menuNameLabel: UILabel!
        = self.uiModel.setLabel(text: "Personal Option", size: 15, view: self.view)
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAutoLayout()
        setFunction()
    }
    
    // MARK: - User actions
    
    func setAutoLayout() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        menuNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        menuNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        menuNameLine.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor, constant: 10).isActive = true
        menuNameLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        menuNameLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        tableView.topAnchor.constraint(equalTo: menuNameLine.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    
    func setFunction() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        confirmButton.addTarget(self, action: #selector(checkChangedOption), for: .touchUpInside)
        
        setPersonalOptionList()
    }
    
    
    func setPersonalOptionList() {
        switch menuInstance.menuList[menuInstance.menuInfoStructureInstance.name] {
        case .coffee(_, _, _, let shot, let syrup, let ice, let water, _, _,_) :
            optionList["Shot"]  = shot
            optionList["Syrup"] = syrup
            optionList["Ice"]   = ice
            optionList["Water"] = water
            
        case .nonCoffee(_, _, _, let ice, let water, _, _, _) :
            optionList["Ice"]   = ice
            optionList["Water"] = water
            
        case .filters :
            break
            
        case .dessert:
            break
            
        default :
            break
        }
    }
}

// MARK: - @objc Function List

extension PersonalOptionTableViewController {
    @objc func toChangeShot(_ sender: UIButton) {
        
        switch sender.titleLabel?.text {
        case "Ice" :
            let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionIceViewController") as! OptionIceViewController
            AfterVC.delegate = self
            AfterVC.sheetPresentationController?.detents = [.medium()]
        
            present(AfterVC, animated: true, completion: nil)
            
        case "Shot" :
            let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionShotViewController") as! OptionShotViewController
            AfterVC.delegate = self
            AfterVC.sheetPresentationController?.detents = [.medium()]
        
            present(AfterVC, animated: true, completion: nil)
            
        case "Syrup" :
            guard let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionSyrupViewController") as? OptionSyrupViewController else { return }
            AfterVC.delegate = self
            AfterVC.sheetPresentationController?.detents = [.medium()]
        
            present(AfterVC, animated: true, completion: nil)
            
        case "Water" :
            guard let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionWaterViewController") as? OptionWaterViewController else { return }
            AfterVC.delegate = self
            AfterVC.sheetPresentationController?.detents = [.medium()]
        
            present(AfterVC, animated: true, completion: nil)
        
        default :
            break
        }
    }
    
    
    @objc func checkChangedOption() {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - personalTableView

class personalTableView: UITableViewCell {
    let optionButton = UIButton()
}

// MARK: - extension PersonalOptionViewTable

extension PersonalOptionTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionList.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalOptionCell", for: indexPath) as! personalTableView
        
        cell.addSubview(cell.optionButton)
        cell.optionButton.configuration = .plain()
        cell.optionButton.configuration?.title = (optionList.keys.sorted())[indexPath.row]

        switch (optionList.keys.sorted())[indexPath.row] {
        case "Ice":
            cell.optionButton.configuration?.subtitle = menuInstance.menuInfoStructureInstance.ice
            
        case "Shot" :
            cell.optionButton.configuration?.subtitle = String(menuInstance.menuInfoStructureInstance.shot!)
            
        case "Syrup":
            cell.optionButton.configuration?.subtitle = String(menuInstance.menuInfoStructureInstance.syrup!)
            
        case "Water":
            cell.optionButton.configuration?.subtitle = menuInstance.menuInfoStructureInstance.water
            
        default:
            break
        }
        cell.optionButton.translatesAutoresizingMaskIntoConstraints = false
        cell.optionButton.contentHorizontalAlignment = .leading
        cell.optionButton.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10).isActive = true
        cell.optionButton.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
        cell.optionButton.addTarget(self, action: #selector(toChangeShot), for: .touchUpInside)
        
        return cell
    }
}

// MARK: - Delegate

extension PersonalOptionTableViewController: SendIceValue, SendShotValue, SendSyrupValue, SendWaterValue {
    func sendIceValueAndReloadData(data: String) {
        tableView.reloadData()
    }
    
    func sendShotValueAndReloadData(data: Int) {
        tableView.reloadData()
    }
    
    func sendSyrupValueAndReloadData(data: Int) {
        tableView.reloadData()
    }
    
    func sendWaterValueAndReloadData(data: String) {
        tableView.reloadData()
    }
}
