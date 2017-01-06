//
//  Container3.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class Container3: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var contentcCollectionView: UICollectionView!
    
    // データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // レシピの数を返す
        return 30
        
    }
    
    // データを返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // コレクションビューから識別子「contentsCell」のセルを取得する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentsCell", for: indexPath) as! C3CollectionViewCell
        
        // セルに画像を設定する
        cell.contentsImageView.image = UIImage(named: "IMG_9453.JPG")
        cell.contentsImageView.layer.borderColor = UIColor.white.cgColor // imageViewに枠線をつける
        cell.contentsImageView.layer.borderWidth = 1 // 枠線の太さを1にする
        
        return cell
    }
    
    // セルがタップされた時に呼ばれるメソッド
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // モーダルを表示
        let c3DetailViewModal = storyboard?.instantiateViewController(withIdentifier: "C3Detail") as! C3DetailViewController
        c3DetailViewModal.index = indexPath.row
        self.present(c3DetailViewModal, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // コレクションビューのデリゲート先をこのコントロラーに設定
        contentcCollectionView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
