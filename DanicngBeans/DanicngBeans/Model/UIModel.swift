//
//  UIModel.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/29.
//

import Foundation
import UIKit

class UIModel {
    
    func setSelectButton(buttonTitle: String, buttonWidth: CGFloat, buttonHeight: CGFloat) -> UIButton {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.configuration?.title = buttonTitle
        button.titleLabel?.font = UIFont(name: "Gill Sans", size: 12)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 12
        
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
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        
        return line
    }
    
    
}
