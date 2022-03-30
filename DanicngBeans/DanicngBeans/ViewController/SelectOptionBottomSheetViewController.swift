//
//  ViewController.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/02/06.
//

import UIKit


class SelectOptionBottomSheetViewController: UIViewController {
    
    let main = MainModel.shared
    
    var menuName: String?
    var shotCount: Int?
    var indexOfOneAndOnly: Int?
    
    private var confirmButton = UIButton()
    
    @IBOutlet weak var menuNameLabel: UILabel!
    
    private var newShotOptionButton = UIButton()
    private var esspressoShotCountLabel2 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(confirmButton)
        view.addSubview(newShotOptionButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        newShotOptionButton.translatesAutoresizingMaskIntoConstraints = false
        
        if main.modifiedMenuInfoInstance.shot == nil {
            self.newShotOptionButton.isHidden = true
            esspressoShotCountLabel2.isHidden = true
        } else {
            esspressoShotCountLabel2.text = "\(shotCount!)개"
            
            view.addSubview(esspressoShotCountLabel2)
            esspressoShotCountLabel2.translatesAutoresizingMaskIntoConstraints = false
            esspressoShotCountLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            esspressoShotCountLabel2.topAnchor.constraint(equalTo: newShotOptionButton.bottomAnchor, constant: 20).isActive = true
            
        }
        
        menuNameLabel.text = menuName
        menuNameLabel.adjustsFontSizeToFitWidth = true
        
        confirmButton.setTitle("CHECK", for: .normal)
        confirmButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.layer.cornerRadius = 12
        confirmButton.addTarget(self, action: #selector(checkChangedOption), for: .touchUpInside)
        
        newShotOptionButton.setTitle("Shot Option", for: .normal)
        newShotOptionButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 20)
        newShotOptionButton.titleLabel?.adjustsFontSizeToFitWidth = true
        newShotOptionButton.setTitleColor(.white, for: .normal)
        newShotOptionButton.backgroundColor = .systemBlue
        newShotOptionButton.layer.cornerRadius = 12
        newShotOptionButton.addTarget(self, action: #selector(toChangeShot), for: .touchUpInside)
        
        confirmButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        newShotOptionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        newShotOptionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        newShotOptionButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60).isActive = true
        newShotOptionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
    }
    
    // MARK: - User actions
    
    @IBAction func selectShot(_ sender: Any) {
        guard let AfterVC = self.storyboard?.instantiateViewController(withIdentifier: "OptionShotViewController") as? OptionShotViewController else { return }
        
        AfterVC.delegate = self
        
        AfterVC.sheetPresentationController?.detents = [.medium()]
        
        present(AfterVC, animated: true, completion: nil)
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


// MARK: - Delegate

// 이전 view(Select OPtion Bottom Sheet ViewController)을 대신해 작성한 함수
extension SelectOptionBottomSheetViewController: SelectOptionBottomSheetDelegate {
    func adjustOption(_ vc: UIViewController, value: Int?) {
        
        esspressoShotCountLabel2.text = ("\(main.modifiedMenuInfoInstance.shot!)개")
        main.modifiedMenuInfoInstance.shot = value
        
        
    }
}
