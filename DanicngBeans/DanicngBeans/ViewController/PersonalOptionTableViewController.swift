//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/06.
//

import UIKit


class PersonalOptionTableViewController: UIViewController {
    let main = MainModel.shared
    var delegate: PersonalOptionTableDelegate?
    var optionList: Dictionary<String, Any> = [:]
    
    var menuName: String!
    var shotCount: Int?
    var indexOfOneAndOnly: Int?
    
    private var confirmButton = UIButton()
    private var shotOptionButton = UIButton()
    private var shotCountLabel = UILabel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuNameLabel: UILabel!

    var paramTest: String = ""
    var count = 0
    
    // MARK: - viewControllerCycle
        
    override func viewWillAppear(_ animated: Bool) {
        print("paramTest : \(paramTest)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalOptionCell") as! personalTableView
        // shotCountLabel.text = ("\(main.menuInfoInstance.shot!)개")
        cell.optionButton.configuration?.title = "\(String(describing: main.menuInfoInstance.shot))개"
        
        // MARK: - tableView 새로 세팅하게되면 안 쓸 코드
        if main.menuInfoInstance.shot == nil {
            shotOptionButton.isHidden = true
            shotCountLabel.isHidden = true
        } else {
            shotOptionButton.isHidden = true
            shotCountLabel.isHidden = true
            view.addSubview(shotOptionButton)
            view.addSubview(shotCountLabel)
            shotCountLabel.text = "\(shotCount!)개"
            shotCountLabel.translatesAutoresizingMaskIntoConstraints = false
            shotCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            shotCountLabel.topAnchor.constraint(equalTo: shotOptionButton.bottomAnchor, constant: 20).isActive = true
            
        }
        
        // MARK: - 기존 코드
        
        view.addSubview(confirmButton)
        view.addSubview(shotOptionButton)
        
        menuNameLabel.text = menuName
        menuNameLabel.adjustsFontSizeToFitWidth = true
        
        confirmButton.setTitle("CHECK", for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.layer.cornerRadius = 12
        confirmButton.addTarget(self, action: #selector(checkChangedOption), for: .touchUpInside)
        
        shotOptionButton.setTitle("Shot Option", for: .normal)
        shotOptionButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        shotOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        shotOptionButton.setTitleColor(.white, for: .normal)
        shotOptionButton.backgroundColor = .systemBlue
        shotOptionButton.layer.cornerRadius = 12
        shotOptionButton.addTarget(self, action: #selector(toChangeShot), for: .touchUpInside)
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        shotOptionButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        confirmButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        shotOptionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shotOptionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        shotOptionButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        shotOptionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        // MARK: - table view 수정 코드
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        switch main.menuList[menuName] {
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


    
    // MARK: - User actions
    
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableView 생성 func 는 viewDidLoad 시 한 번만 되는듯
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalOptionCell", for: indexPath) as! personalTableView
        print(count)
        count += 1
        cell.addSubview(cell.optionButton)
        cell.optionButton.configuration = .plain() // optionButton.configuration Instance 생성
        // cell.optionButton.configuration?.title = (optionList.keys.sorted())[indexPath.row]
        cell.optionButton.configuration?.title = paramTest
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
    
    func sendData(value: Int?){
        self.paramTest = (value)?.description ?? "0"
    }
    
    func adjustOption(_ vc: UIViewController, value: Int?) {
        // shotCountLabel.text = ("\(main.menuInfoInstance.shot!)개")
        main.menuInfoInstance.shot = value
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personalOptionCell") as! personalTableView
        
        cell.optionButton.configuration?.title = String(Int(value!))
        
        
    }
}



