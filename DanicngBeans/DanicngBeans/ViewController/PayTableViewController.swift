import UIKit

class PayTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: PayTableDelegate?

    let cellIdentifier: String = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pay"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1    // section 수는 일단 1개로 선언
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Value.sharedInstance().globalCountInt == 0 {
            tableView.setEmptyView(title: "현재 담긴 메뉴가 없습니다!", message: "")
            
        } else {
            tableView.restore()
        }
        
        switch section {
        case 0:
            // Value.swift 에서 선언한 globalCountInt 전역변수를 이용해서 count > SelectOptionViewController - addMenuCartButtonTapped 누를 때 마다 count +1
            // n개 이상시 스크롤 가능
            return Value.sharedInstance().globalCountInt
            
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)

        let text: String = indexPath.section == 0 ? Value.sharedInstance().globalOrderMenuList[indexPath.row] : "test"
        
        cell.textLabel?.text = text

        return cell
    }
}

extension UITableView {
    
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        // 기본 값에 image 삽입하려고 함
        let titleImage = UIImage(named: "Sorry :(")
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        titleLabel.text = title
        messageLabel.text = message
        
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
