//
//  cartDelegate.swift
//  DancingBeans
//
//  Created by JAEHYEON on 2022/01/21.
//

import UIKit

// protocol 에서는 기능을 직접 구현하지 않는다
// 왜?
protocol SelectOptionBottomSheetDelegate {

    func adjustOption(_ vc: UIViewController, value : Int?)
}


