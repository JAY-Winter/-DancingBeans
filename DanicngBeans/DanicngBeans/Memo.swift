//
//  Memo.swift
//  DanicngBeans
//
//  Created by JAEHYEON on 2022/03/23.
//

import Foundation

class Memo {
    
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
    
    static var dummyMemoList = [ Memo(title: "first memo", content: "first memo content"), Memo(title: "sec memo", content: "sec memo contentn")]
    
}
