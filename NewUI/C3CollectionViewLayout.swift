//
//  C3CollectionViewLayout.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/25.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class C3CollectionViewLayout: UICollectionViewLayout {
    
    // 列数
    let numberOfColumns = 2
    
    // セルの高さ
    let cellHeight: CGFloat = CGFloat(DeviceSize.screenWidth() / 2)
    
    // レイアウト配列
    private var layoutData = [UICollectionViewLayoutAttributes]()
    
    // レイアウトを準備するメソッド(コレクションビュー描画前に一度だけ呼ばれるメソッド)
    override func prepare() {
        
        // 全体の幅
        let allWidth = DeviceSize.screenWidth()
        
        // 列の幅
        let columnWidth: CGFloat = (CGFloat(allWidth) / CGFloat(numberOfColumns))
        
        // 座標
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        // セルを配置
        for i in 0 ..< collectionView!.numberOfItems(inSection: 0) {

            let indexPath = NSIndexPath(item: i, section: 0)
            
            // レイアウト配列にセルの位置とサイズを登録する
            let frame = CGRect(
                x: x,
                y: y,
                width: columnWidth,
                height: cellHeight
            )
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            attributes.frame = frame
            layoutData.append(attributes)
            
            // XY座標を更新
            if(i % 2 == 0) {
                
                x = columnWidth
                
            } else {
                
                x = 0
                y = y + cellHeight
                
            }
        }
    }
    
    // レイアウトを返すメソッド
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        return layoutData
    }
    
    // コレクションビューの全体サイズを返すメソッド
    override var collectionViewContentSize: CGSize {
        
        // 全体の幅
        let allWidth: CGFloat = CGFloat(DeviceSize.screenWidth())
        
        // 全体の高さ
        let allHeight = CGFloat(collectionView!.numberOfItems(inSection: 0)) * cellHeight
        
        return CGSize(width: allWidth, height: allHeight)
    }

}
