//  UIModel.swift
//  DanicngBeans
//  Created by JAEHYEON on 2022/03/29.

import Foundation
import UIKit

class UIModel {
    
    func setSelectButton(buttonTitle: String, font: String, fontSize: CGFloat, fontColor: UIColor, backGroundColor: UIColor, buttonWidth: CGFloat, buttonHeight: CGFloat, view: UIView) -> UIButton {
        let button = UIButton()
        
        button.setTitle(buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont(name: font, size: fontSize)
        button.setTitleColor(fontColor, for: .normal)
        button.backgroundColor = backGroundColor
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.layer.cornerRadius = 8
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        return button
    }

    
    func setLabel(text: String, size: CGFloat, view: UIView) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "HelveticaNeue", size: size)
        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    
    func setUIImageView(imageName: String, view: UIView) -> UIImageView {
        let imageView = UIImageView()
        
        if let image = UIImage(named: imageName) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "Sorry :(")
        }
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    
    
    func setStepper(min: Double, max: Double, view: UIView) -> UIStepper {
        let stepper = UIStepper()

        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = min
        stepper.maximumValue = max

        view.addSubview(stepper)
        stepper.translatesAutoresizingMaskIntoConstraints = false

        return stepper
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
}
