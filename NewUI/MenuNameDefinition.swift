//
//  MenuNameDefinition.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

// メニュー用スクロールビューにメニュー名を返すための構造体
struct MenuNameDefinition {
    
    // メニューに入るテキスト一覧
    static func getMenuNameList() -> [String] {
        
        return [
            "新着",
            "特集",
            "ゴックン期",
            "モグモグ期",
            "カミカミ期",
            "パクパク期",
            "幼児食",
            "ランキング"
        ]
        
    }
    
    // メニュー数を返す
    static func getMenuNumber() -> Int {
        
        let target: Array = self.getMenuNameList()
        return target.count
        
    }
    
    // インデックスに対応するテキストを返す
    static func getMenuLabelName(_ key: Int) -> String {
        
        let target: Array = self.getMenuNameList()
        return target[key]
        
    }
}
