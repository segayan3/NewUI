//
//  NewRecipeCollectionViewLayout.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2017/01/06.
//  Copyright © 2017年 segayan3. All rights reserved.
//

import UIKit

class NewRecipeCollectionViewLayout: UICollectionViewLayout {
    
    let topColumns = 1 // １番目のセルのみ１列
    let otherColumns = 2 // ２番目以降のセルは２列
    let topHeight: CGFloat = CGFloat(DeviceSize.screenWidth())
    let otherHeight: CGFloat  = CGFloat(DeviceSize.screenWidth() / 2)
    
    // レイアウト配列
    private var layoutData = [UICollectionViewLayoutAttributes]()
    
    // レイアウトを準備するメソッド
    override func prepare() {
        
        // 全体の幅
        let allWidth = DeviceSize.screenWidth()
        
        // １番目のセルの幅
        let topWidth = DeviceSize.screenWidth()
        
        // ２番目以降のセルの幅
        let otherWidth = DeviceSize.screenWidth() / 2
        
        // 座標
        var x: CGFloat = 0
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
                    height: topHeight
                )
                
                // Y座標を更新
                y = y + topHeight
            }else{
                frame = CGRect(
                    x: x,
                    y: y,
                    width: CGFloat(otherWidth),
                    height: otherHeight
                )
                
                // XY座標を更新
                if(i % 2 == 0){
                    x = 0
                    y = y + otherHeight
                }else{
                    x = CGFloat(otherWidth)
                }
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
    
    // 全体サイズを返すメソッド
    override var collectionViewContentSize: CGSize {
        
        // 全体の幅
        let allWidth = CGFloat(DeviceSize.screenWidth())
        
        // 全体の高さ
        let allHeight = CGFloat(collectionView!.numberOfItems(inSection: 0)) * otherHeight + topHeight
        
        return CGSize(width: allWidth, height: allHeight)
    }

}
