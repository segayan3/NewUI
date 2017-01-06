//
//  ContentsContainerDefinition.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

enum ContentsContainerDefinition: Int {
    
    case contentsContainer1, contentsContainer2, contentsContainer3, contentsContainer4, contentsContainer5, contentsContainer6, contentsContainer7, contentsContainer8
    
    // 状態に対応する値を返す
    func returnValue() -> Int {
        
        return self.rawValue // contentsContainer1なら0, contentsContainer1なら1, ...
        
    }
    
}
