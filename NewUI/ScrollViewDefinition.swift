//
//  ScrollViewDefinition.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/25.
//  Copyright © 2016年 segayan3. All rights reserved.
//

enum ScrollViewDefinition: Int {
    
    // スクロールの名称
    case menuButtonArea, contentsArea
    
    // 状態に対応する値を返す
    func returnValue() -> Int {
        
        return self.rawValue // menuButtonAreaなら0, contentsAreaなら1
        
    }
}
