import UIKit


class PayTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let main = MainModel.shared
    private let cellIdentifier: String = "cell"
    
    private var delegate: PayTableDelegate?
    
    // MARK: - User actions
    
    @IBOutlet weak var tableView: UITableView!
    // @IBOutlet weak var totalPriceLabel: UILabel!
    
    private var totalPriceLabel = UILabel()
    private var orderButton: UIButton!
    
    // MARK: - User actions
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "Payment"

        self.view.backgroundColor = UIColor(named: "defaultBackGroundColor")
        
        orderButton = UIButton(type: .system)

        view.addSubview(orderButton)
        view.addSubview(totalPriceLabel)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        totalPriceLabel.text = main.setDeciamlWon(value: main.accumlator)
        totalPriceLabel.font = UIFont(name: "Gill Sans", size: 20)
        totalPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        totalPriceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        orderButton.setTitle("PAY", for: .normal)
        orderButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.backgroundColor = .systemBlue
        orderButton.layer.cornerRadius = 12
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    // MARK: - User actions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if main.addedMenuList.count == 0 {
            tableView.setEmptyView(title: "현재 담긴 메뉴가 없습니다!")
            totalPriceLabel.isHidden = true
            orderButton.isHidden = true
        } else {
            tableView.restore()
        }
        return main.addedMenuList.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let addedMenu = main.addedMenuList[indexPath.row]
        
        cell.nameLabel.text = addedMenu.name
        cell.optionLabel.text = "\(addedMenu.getWay!)⎜\(addedMenu.temp!)⎜\(addedMenu.count!)잔"
        
        if let isShotMenu = addedMenu.shot {
            cell.option2Label.text = "\(isShotMenu)shot"
        } else {
            cell.option2Label.isHidden = true
        }
        
        cell.priceLabel.text = main.setDeciamlWon(value: addedMenu.price)
        
        cell.menuImageView.translatesAutoresizingMaskIntoConstraints = false
        cell.menuImageView.contentMode = .scaleAspectFit
        cell.menuImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        cell.menuImageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0).isActive = true
        cell.menuImageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -200).isActive = true
        cell.menuImageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true

        
        cell.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.nameLabel.adjustsFontSizeToFitWidth = true
        cell.nameLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
        cell.nameLabel.leadingAnchor.constraint(equalTo: cell.menuImageView.trailingAnchor, constant: 10).isActive = true
        cell.nameLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
        
        cell.optionLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.optionLabel.adjustsFontSizeToFitWidth = true
        cell.optionLabel.topAnchor.constraint(equalTo: cell.nameLabel.bottomAnchor, constant: 10).isActive = true
        cell.optionLabel.leadingAnchor.constraint(equalTo: cell.menuImageView.trailingAnchor, constant: 10).isActive = true

        cell.option2Label.translatesAutoresizingMaskIntoConstraints = false
        cell.option2Label.adjustsFontSizeToFitWidth = true
        cell.option2Label.topAnchor.constraint(equalTo: cell.nameLabel.bottomAnchor, constant: 30).isActive = true
        cell.option2Label.leadingAnchor.constraint(equalTo: cell.menuImageView.trailingAnchor, constant: 10).isActive = true
        
        cell.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.priceLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -10).isActive = true
        cell.priceLabel.leadingAnchor.constraint(equalTo: cell.menuImageView.trailingAnchor, constant: 10).isActive = true
        
        
        
        if let menuImage = UIImage(named: addedMenu.name) {
            cell.menuImageView.image = menuImage
            
        } else {
            cell.menuImageView.image = UIImage(named: "Sorry :(")
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            main.accumlator -= main.addedMenuList[indexPath.row].price
            main.addedMenuList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
            totalPriceLabel.text = main.setDeciamlWon(value: main.accumlator)
        }
    }
}

// MARK: - CustomCell

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var option2Label: UILabel!
}

// MARK: - Extension

extension UITableView {
    
    func setEmptyView(title: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        emptyView.addSubview(titleLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.text = title
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}


