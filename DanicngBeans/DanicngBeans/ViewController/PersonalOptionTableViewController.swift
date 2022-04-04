//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/06.
//

import UIKit

class PersonalOptionTableViewController: UIViewController {

    private let menuInstance     = MenuInfo.shared
    private var delegate         : PersonalOptionTableDelegate?
    private var optionList       : Dictionary<String, Any> = [:]
    private var indexOfOneAndOnly: Int?
    private var confirmButton    = UIButton()
    private var shotCountLabel   = UILabel()
    
    var menuName : String!
    var shotCount: Int?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuNameLabel: UILabel!

    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: - User actions
    
    func setView() {
        view.addSubview(confirmButton)
        
        menuNameLabel.text = menuName
        menuNameLabel.adjustsFontSizeToFitWidth = true
        
        confirmButton.setTitle("CHECK", for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.layer.cornerRadius = 12
        confirmButton.addTarget(self, action: #selector(checkChangedOption), for: .touchUpInside)
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        switch menuInstance.menuList[menuName] {
        case .coffee(_, _, _, let shot, let syrup, let ice, let water, _, _,_) :
            optionList["Shot"] = shot
            optionList["Syrup"] = syrup
            optionList["Ice"] = ice
            optionList["Water"] = water
            
        case .nonCoffee(_, _, _, let ice, let water, _, _, _) :
            optionList["Ice"] = ice
            optionList["Water"] = water
            
        case .filters :
            break
            
        case .dessert:
            break
            
        default :
            break
        }
    }
    
    
    @objc func toChangeShot() {
        guard let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionShotViewController") as? OptionShotViewController else { return }
        
        AfterVC.delegate = self
        
        AfterVC.sheetPresentationController?.detents = [.medium()]
        
        present(AfterVC, animated: true, completion: nil)
    }
    
    
    @objc func checkChangedOption() {
        
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - extension PersonalOptionViewTable

extension PersonalOptionTableViewController: UITableViewDelegate, UITableViewDataSource{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionList.count
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // tableView 생성 func 는 viewDidLoad 시 한 번만 되는듯
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalOptionCell", for: indexPath) as! personalTableView

        cell.addSubview(cell.optionButton)
        cell.optionButton.configuration = .plain() // optionButton.configuration Instance 생성
        cell.optionButton.configuration?.title = (optionList.keys.sorted())[indexPath.row]
        // cell.optionButton.configuration?.title = paramTest
        cell.optionButton.configuration?.subtitle = (optionList[String((cell.optionButton.configuration?.title!)!)] as AnyObject).debugDescription
        cell.optionButton.contentHorizontalAlignment = .leading
        
        // 임시로 system image "play", image padding 설정
        // cell.optionButton.configuration?.image = UIImage(systemName: "play",
                                                         // withConfiguration: UIImage.SymbolConfiguration(scale: .default))
        // cell.optionButton.configuration?.imagePlacement = .trailing
        // cell.optionButton.configuration?.imagePadding = 100
        // cell.optionButton.configuration?.imagePlacement = cell.optionButton
        
        cell.optionButton.translatesAutoresizingMaskIntoConstraints = false
        cell.optionButton.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10).isActive = true
        cell.optionButton.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
        
        cell.optionButton.addTarget(self, action: #selector(toChangeShot), for: .touchUpInside)
        
        return cell
    }
}

// MARK: - TableView Class
class personalTableView: UITableViewCell {
    var optionButton = UIButton()
}


// MARK: - Delegate

// view(Option Shot ViewController)을 대신해 작성한 함수
extension PersonalOptionTableViewController: SelectOptionBottomSheetDelegate {
    
    func adjustOption(_ vc: UIViewController, value: Int?) {
        // shotCountLabel.text = ("\(main.menuInfoInstance.shot!)개")
        menuInstance.menuInfoStructureInstance.shot = value
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalOptionCell") as! personalTableView
        
        cell.optionButton.configuration?.title = String(Int(value!))
        
        
    }
}



