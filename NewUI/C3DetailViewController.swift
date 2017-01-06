//
//  C3DetailViewController.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/27.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class C3DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // Container3.swiftで選択されたレシピ番号を格納する変数
    var index: Int!
    
    // ヘッダーに表示するレシピ名
    @IBOutlet weak var recipeNameLabelHeader: UILabel!
    
    // レシピ詳細ページを閉じる
    @IBAction func dismissDetailView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // collectionViewのデータの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // collectionViewのデータを返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // collectionViewから識別子DetailCellのセルを取得する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCell", for: indexPath) as UICollectionViewCell
        
        // セルの背景色を設定する
        cell.backgroundColor = UIColor.brown
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.  
        
        let i = String(index)
        recipeNameLabelHeader.text = "\(i)番目のレシピ名を表示します"
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
