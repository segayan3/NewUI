//
//  DeviceSize.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

// 端末のサイズを取得するための構造体
struct DeviceSize {
    
    // CGRectを取得
    static func bounds() -> CGRect {
        
        return UIScreen.main.bounds
        
    }
    
    // 画面の横サイズを取得
    static func screenWidth() -> Int {
        
        return Int(UIScreen.main.bounds.size.width)
        
    }
    
    // 画面の縦サイズを取得
    static func screenHeight() -> Int {
        
        return Int(UIScreen.main.bounds.size.height)
        
    }
}
