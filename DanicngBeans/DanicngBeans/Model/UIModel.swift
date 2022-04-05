//
//  UIModel.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/29.
//

import Foundation
import UIKit

class UIModel {
    
    func setSelectButton(action: Selector , buttonTitle: String, buttonWidth: CGFloat, buttonHeight: CGFloat, view: UIView) -> UIButton {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.configuration?.title = buttonTitle
        button.titleLabel?.font = UIFont(name: "Gill Sans", size: 12)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 12
        button.addTarget(self, action: action, for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        return button
    }
    
    
    func setColoredThinLine(setColor: String, view: UIView) -> UILabel {
        let line = UILabel()
        line.text = " "
        line.font = UIFont(name: "HelveticaNeue-Bold", size: 1)
        line.backgroundColor = UIColor(named: setColor)
        
        view.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        return line
    }
    
    func setLabel(text: String, size: CGFloat, view: UIView) -> UILabel{
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "HelveticaNeue", size: size)
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    @objc func addMenuToCart() {    }
    
    @objc func openSelectOptionBottomSheeet() {    }
    
    
}
