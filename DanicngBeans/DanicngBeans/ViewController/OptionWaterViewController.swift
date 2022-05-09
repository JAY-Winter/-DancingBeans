//
//  OptionWaterViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/04/07.
//

import UIKit



class OptionWaterViewController: UIViewController {

    var delegate: SendWaterValue?
    private let menuInstance = MenuInfo.shared
    private let uiModel = UIModel()
        
    private lazy var confirmButton: UIButton!
        = self.uiModel.setSelectButton(buttonTitle: "적용하기", font: "HelveticaNeue-Bold", fontSize: 15, fontColor: .white, backGroundColor: UIColor(named: "buttonBackGroundColor")!, buttonWidth: 100, buttonHeight: 30, view: self.view)

    override func viewDidLoad() {
        super.viewDidLoad()
        setAutuLayout()
        setFunction()
    }
    
    func setAutuLayout() {
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    func setFunction() {
        self.confirmButton.addTarget(self, action: #selector(adjustNewOption), for: .touchUpInside)
    }
    
    @objc func adjustNewOption() {
        delegate?.sendWaterValueAndReloadData(data: menuInstance.menuInfoStructureInstance.water!)

        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
