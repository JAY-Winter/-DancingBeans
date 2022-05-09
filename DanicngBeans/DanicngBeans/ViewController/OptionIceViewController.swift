//
//  OptionIceViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/04/07.
//

import UIKit


class OptionIceViewController: UIViewController {

    var delegate: SendIceValue?
    private let menuInstance = MenuInfo.shared
    private let uiModel = UIModel()
    
    private var button1: UIButton! = UIButton()
    
    private lazy var confirmButton: UIButton!
        = self.uiModel.setSelectButton(buttonTitle: "적용하기", font: "HelveticaNeue-Bold", fontSize: 15, fontColor: .white, backGroundColor: UIColor(named: "buttonBackGroundColor")!, buttonWidth: 100, buttonHeight: 30, view: self.view)

    override func viewDidLoad() {
        super.viewDidLoad()
        setAutuLayout()
        setFunction()
        
        
        button1.frame = CGRect(x: 150, y: 200, width: 100, height: 100)
        button1.titleLabel?.text = "button1"
        button1.setTitleColor(.black, for: .normal)
        button1.backgroundColor = .brown
        
        view.addSubview(button1)
    }
    
    func setAutuLayout() {
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    func setFunction() {
        self.confirmButton.addTarget(self, action: #selector(adjustNewOption), for: .touchUpInside)
    }
    
    @objc func adjustNewOption() {
        delegate?.sendIceValueAndReloadData(data: menuInstance.menuInfoStructureInstance.ice!)

        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

