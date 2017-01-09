//
//  DetailViewCollectionViewLayout.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2017/01/06.
//  Copyright © 2017年 segayan3. All rights reserved.
//

import UIKit

class DetailViewCollectionViewLayout: UICollectionViewLayout {
    
    let numberColumns = 1 // 列数
    let videoHeight: CGFloat = 600
    let recipeHeight: CGFloat = 800
    
    // レイアウト配列
    private var layoutData = [UICollectionViewLayoutAttributes]()
    
    // レイアウトを準備するメソッド
    override func prepare() {
        
        // 全体の幅（列の幅）
        let allWidth = DeviceSize.screenWidth()
        
        // 座標
        let x: CGFloat = 0
        var y: CGFloat = 0
        
        // セルを配置
        for i in 0 ..< collectionView!.numberOfItems(inSection: 0) {
            
            let indexPath = NSIndexPath(item: i, section: 0)
            
            // レイアウト配列にセルの位置とサイズを登録する
            var frame: CGRect!
            if(i == 0){
                frame = CGRect(
                    x: x,
                    y: y,
                    width: CGFloat(allWidth),
                    height: videoHeight
                )
                
                // Y座標を更新
                y = y + videoHeight + 30
            } else if(i == 1) {
                frame = CGRect(
                    x: x,
                    y: y,
                    width: CGFloat(allWidth),
                    height: recipeHeight
                )
            }
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            attributes.frame = frame
            layoutData.append(attributes)
        }
        
    }
    
    // レイアウトを返すメソッド
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutData
    }
    
    // collectionViewの全体サイズを返すメソッド
    override var collectionViewContentSize: CGSize {
        
        // collectionViewの幅
        let allWidth: CGFloat = CGFloat(DeviceSize.screenWidth())
        
        // collectionViewの高さ
        let allHeight: CGFloat = CGFloat(collectionView!.numberOfItems(inSection: 0)) * recipeHeight - 150
        
        return CGSize(width: allWidth, height: allHeight)
    }

}
