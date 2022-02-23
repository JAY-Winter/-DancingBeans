//
//  CalculatorViewController.swift
//  inflearn
//
//  Created by JAEHYEON on 2022/02/16.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var brain = CalculatorBrain()
    
    private var userIsInTheMiddleOfTyping = false
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBOutlet private weak var display: UILabel!
    
    // 0 ~ 9 숫자 버튼을 눌렀을 때 func
    @IBAction private func touchDigit(_ sender: UIButton) {
        
        guard let digit = sender.titleLabel?.text else {
            return
        }
        
        // false 문(display.text! = digit) 실행 > userIsInTheMiddleOfTyping = true 로 변환 > 다른 숫자버튼 클릭 > true 문 실행
        if userIsInTheMiddleOfTyping {
            let textCuttentlyDisplay = display.text!
            display.text! = textCuttentlyDisplay + digit
        } else {
            display.text! = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    // 수식 버튼을 눌렀을 때 func, 현재 userIsInTheMiddleOfTyping = true
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            // func touchDIgit 실행 시 false 구문에서 시작할 수 있게 false 설정
            userIsInTheMiddleOfTyping = false
        }
        
        //button.titleLable?.text! 가 nil 이 아닐 때 if let 구문 실행
        if let mathematicalSymbol = sender.titleLabel?.text! {
            // brain = CalcutorBrain class의 instance 생성
            // intance 의 method 중 performOperation 실행, symbol parameter는 sender.titleLabel?.text!
            brain.performOperation(symbol: mathematicalSymbol)
        }
        
        displayValue = brain.result
    }
}
