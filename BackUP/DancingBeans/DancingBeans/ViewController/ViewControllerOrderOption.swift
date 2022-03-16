import UIKit

class ViewControllerOrderOption: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    let korean: [String] = ["테스트", "입니다"]
    let english: [String] = ["this is", "test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0:
            return korean.count
            
        case 1:
            return english.count
            
        default :
            return 0
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
        
        cell.textLabel?.text = text
        
        
        return cell
    }
    
}
