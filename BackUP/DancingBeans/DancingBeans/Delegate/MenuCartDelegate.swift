//
//  cartDelegate.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import Foundation

// protocol 에서는 기능을 직접 구현하지 않는다
// 왜?
protocol MenuCartDelegate {
    func alarmCartIsFilled(itemCount: Int)
}
