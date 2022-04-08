//
//  OptionSyrupViewController.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/04/07.
//

import UIKit


class OptionSyrupViewController: UIViewController {

    var delegate: SendSyrupValue?
    private let uiModel = UIModel()
    private let menuInstance = MenuInfo.shared
    
    private lazy var syrupNameLabel: UILabel!
        = self.uiModel.setLabel(text: "Syrup", size: 15, view: self.view)
    
    private lazy var syrupShotCountStepper: UIStepper!
        = self.uiModel.setStepper(min: 0, max: 4, view: self.view)
    
    private lazy var syrupShotCountLabel: UILabel!
        = self.uiModel.setLabel(text: String(menuInstance.menuInfoStructureInstance.syrup!), size: 15, view: self.view)

    private lazy var confirmButton: UIButton!
        = self.uiModel.setSelectButton(buttonTitle: "적용하기", font: "HelveticaNeue-Bold", fontSize: 15, fontColor: .white, backGroundColor: UIColor(named: "buttonBackGroundColor")!, buttonWidth: 100, buttonHeight: 30, view: self.view)

    override func viewDidLoad() {
        super.viewDidLoad()
        setAutuLayout()
        setFunction()
    }
    
    func setAutuLayout() {
        syrupNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        syrupNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        syrupShotCountStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        syrupShotCountStepper.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        syrupShotCountLabel.leadingAnchor.constraint(equalTo: syrupShotCountStepper.trailingAnchor, constant: 60).isActive = true
        syrupShotCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    func setFunction() {
        confirmButton.addTarget(self, action: #selector(adjustNewOption), for: .touchUpInside)
        
        syrupShotCountStepper.wraps = false
        syrupShotCountStepper.isContinuous = false
        syrupShotCountStepper.value = Double(menuInstance.menuInfoStructureInstance.syrup!)
        syrupShotCountStepper.addTarget(self, action: #selector(countSyrupShotStepper(_:)), for: .touchUpInside)
    }
    
    
    @objc func countSyrupShotStepper(_ sender: UIStepper) {
        syrupShotCountLabel.text = String(Int(sender.value))
    }
    
    
    @objc func adjustNewOption() {
        menuInstance.menuInfoStructureInstance.syrup = Int(syrupShotCountStepper.value)
        
        delegate?.sendSyrupValueAndReloadData(data: menuInstance.menuInfoStructureInstance.syrup!)

        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
