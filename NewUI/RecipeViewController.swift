//
//  RecipeViewController.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UIScrollViewDelegate {
    
    // ロゴの座標とサイズ
    let logoX: Int = 0
    let logoY: Int = 20
    let logoW: Int = 50
    let logoH: Int = 50
    
    // 検索窓の座標とサイズ
    let searchX: Int = 50
    let searchY: Int = 20
    let searchH: Int = 50 // searchWは計算で算出する
    
    // メニュー用スクロールビュー
    var menuScrollView: UIScrollView!
    
    // メニュー用スクロールビューの座標とサイズ
    let menuScrollViewX: Int = 0 // menuScrollViewYは計算で算出する
    let menuScrollViewH: Int = 40 // menuScrollViewWは計算で算出する
    
    // メニューボタンの移動量
    var menuScrollViewButtonOffsetX: Int!
    
    // 動くラベル
    var slidingLabel: UILabel!
    
    // 動くラベルの座標とサイズ
    let slidingLabelH: Int = 5 // slidingLabelWは計算で算出する

    // コンテンツスクロールビュー
    @IBOutlet weak var contentsScrollView: UIScrollView!
    
    // コンテンツ表示用コンテナビュー
    @IBOutlet weak var contentsContainer1: UIView!
    @IBOutlet weak var contentsContainer2: UIView!
    @IBOutlet weak var contentsContainer3: UIView!
    @IBOutlet weak var contentsContainer4: UIView!
    @IBOutlet weak var contentsContainer5: UIView!
    @IBOutlet weak var contentsContainer6: UIView!
    @IBOutlet weak var contentsContainer7: UIView!
    @IBOutlet weak var contentsContainer8: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // ロゴを配置
        let logoImageView = UIImageView(frame: CGRect(
            x: logoX,
            y: logoY,
            width: logoW,
            height: logoH
        ))
        view.addSubview(logoImageView)
        logoImageView.backgroundColor = UIColor.yellow
        
        // 検索窓を配置
        let searchBar = UISearchBar(frame: CGRect(
            x: searchX,
            y: searchY,
            width: (DeviceSize.screenWidth() - logoW),
            height: logoH
        ))
        view.addSubview(searchBar)
        
        // メニュー用スクロールビューを配置
        menuScrollView = UIScrollView(frame: CGRect(
            x: menuScrollViewX,
            y: (logoY + searchH),
            width: DeviceSize.screenWidth(),
            height: menuScrollViewH))
        view.addSubview(menuScrollView)
        menuScrollView.backgroundColor = UIColor.gray
        
        // メニュー用スクロールビューのデリゲートを設定
        //menuScrollView.delegate = self
        
        // メニュー用スクロールビューの各種設定
        menuScrollView.contentSize = CGSize(
            width: (DeviceSize.screenWidth() / 3) * MenuNameDefinition.getMenuNumber(),
            height: menuScrollViewH)
        menuScrollView.showsHorizontalScrollIndicator = false
        menuScrollView.tag = ScrollViewDefinition.menuButtonArea.returnValue()
        
        // メニュー用スクロールビューの中身を作成
        for i in 0 ..< MenuNameDefinition.getMenuNumber() {
            
            let menuButton = UIButton()
            menuButton.frame = CGRect( // ボタンサイズ(上下に5ずつ余白を取る)
                x: 0,
                y: 0,
                width: CGFloat(DeviceSize.screenWidth() / 3),
                height: CGFloat(menuScrollViewH - 10)
            )
            menuButton.layer.position = CGPoint( // ボタンの配置位置
                x: CGFloat((DeviceSize.screenWidth() / 3) / 2 + (DeviceSize.screenWidth() / 3) * i),
                y: CGFloat(menuScrollViewH / 2)
            )
            menuButton.backgroundColor = UIColor(
                red: CGFloat(drand48()),
                green: CGFloat(drand48()),
                blue: CGFloat(drand48()),
                alpha: 1.0)
            menuButton.setTitleColor(UIColor.white, for: .normal)
            menuButton.setTitle(MenuNameDefinition.getMenuLabelName(i), for: .normal)
            menuButton.tag = i // ボタンに識別子としてタグを設定
            menuScrollView.addSubview(menuButton)
            
            menuButton.addTarget(self, action: #selector(handleTapMenuButton), for: .touchUpInside) // ボタンがタップされた時の処理

        }
        
        // 動くラベルを配置
        slidingLabel = UILabel()
        menuScrollView.addSubview(slidingLabel)
        slidingLabel.frame = CGRect(
            x: 0,
            y: CGFloat(menuScrollViewH - 5),
            width: CGFloat(DeviceSize.screenWidth() / 3),
            height: CGFloat(slidingLabelH)
        )
        slidingLabel.backgroundColor = UIColor.brown
        
        // コンテンツ用スクロールビューの各種設定
        contentsScrollView.contentSize = CGSize(
            width: CGFloat(DeviceSize.screenWidth() * MenuNameDefinition.getMenuNumber()),
            height: CGFloat(DeviceSize.screenHeight() - 20 - logoH - menuScrollViewH - 50)
        )
        contentsScrollView.tag = ScrollViewDefinition.contentsArea.returnValue() // コンテンツ用スクロールビュに識別子としてタグを設定
        
        // コンテンツ用スクロールビューのデリゲートを設定
        contentsScrollView.delegate = self
        
        // コンテンツ用スクロールビューの中身を作成(コンテナを生成)
        for i in 0 ..< MenuNameDefinition.getMenuNumber() {
            
            addContentsContainerView(i)
        
        }

    }
    
    // コンテンツ用スクロールビューの中身を作成(コンテナを生成)
    func addContentsContainerView(_ i: Int) {
        
        let pX: CGFloat = CGFloat(DeviceSize.screenWidth() * i)
        let pY: CGFloat = CGFloat(menuScrollViewH)
        let pW: CGFloat = CGFloat(DeviceSize.screenWidth())
        let pH: CGFloat = CGFloat(DeviceSize.screenHeight() - 20 - logoH - menuScrollViewH)
        
        if i == ContentsContainerDefinition.contentsContainer1.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer1)
            self.contentsContainer1.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
            
        } else if i == ContentsContainerDefinition.contentsContainer2.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer2)
            self.contentsContainer2.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
        
        } else if i == ContentsContainerDefinition.contentsContainer3.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer3)
            self.contentsContainer3.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
            
        } else if i == ContentsContainerDefinition.contentsContainer4.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer4)
            self.contentsContainer4.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
            
        } else if i == ContentsContainerDefinition.contentsContainer5.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer5)
            self.contentsContainer5.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
            
        } else if i == ContentsContainerDefinition.contentsContainer6.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer6)
            self.contentsContainer6.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
            
        } else if i == ContentsContainerDefinition.contentsContainer7.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer7)
            self.contentsContainer7.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
            
        } else if i == ContentsContainerDefinition.contentsContainer8.returnValue() {
            
            self.contentsScrollView.addSubview(self.contentsContainer8)
            self.contentsContainer8.frame = CGRect(x: pX, y: pY, width: pW, height: pH)
            
        }
        
    }

    // コンテンツスクロールビューがスクロールされた時の処理
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // コンテンツのスクロールのみを検知する
        if contentsScrollView.tag == ScrollViewDefinition.contentsArea.returnValue() {

            // 現在表示されているページ番号を判定する
            let pageWidth: CGFloat = contentsScrollView.frame.size.width // コンテンツコンテナの横幅を取得
            let pagePosition: Double = Double(contentsScrollView.contentOffset.x / pageWidth) // コンテンツスクロールビュー全体に対するそのコンテンツコンテナの位置を取得
            let page: Int = lround(pagePosition) // 四捨五入して現在表示中のコンテンツページ番号を取得
            
            // 動くラベルをスライドさせる
            UIView.animate(withDuration: 0.2, animations: {
                
                self.slidingLabel.frame = CGRect(
                    x: CGFloat(DeviceSize.screenWidth() / 3 * page),
                    y: CGFloat(self.menuScrollViewH - 5),
                    width: CGFloat(DeviceSize.screenWidth() / 3),
                    height: CGFloat(self.slidingLabelH)
                )
            })
            
            // メニュースクロールビューをスライドさせる
            if page == 0 { // １ページ目ならメニュースクロールビューのスライドは無し
                
                menuScrollViewButtonOffsetX = 0
                
            } else if page == (MenuNameDefinition.getMenuNumber()) { // 最終ページならメニュースクロールビューを最大まで移動
                
                menuScrollViewButtonOffsetX = Int(DeviceSize.screenWidth())
                
            } else { // １ページ目と最終ページ以外の時はメニュースクロールビューをボタン１つ分ずつ移動
                
                menuScrollViewButtonOffsetX = Int(DeviceSize.screenWidth() / 3 * (page - 1)) // -1することで動くラベルが常に真ん中に位置するようになる
            }
 
            UIView.animate(withDuration: 0.2, animations: {
                self.menuScrollView.contentOffset = CGPoint(
                    x: CGFloat(self.menuScrollViewButtonOffsetX),
                    y: 0
                )
            })
        }
        
    }
    
    // メニューボタンがタップされた時の処理
    func handleTapMenuButton(_ button: UIButton) {

        UIView.animate(withDuration: 0.2, animations: {
            
            // コンテンツ表示用のスクロールビューをスライド
            self.contentsScrollView.contentOffset = CGPoint(
                x: CGFloat(DeviceSize.screenWidth() * button.tag),
                y: 0
            )
            
            // メニューのスライディングボタンをスライド
            self.slidingLabel.frame = CGRect(
                x: CGFloat(DeviceSize.screenWidth() / 3 * button.tag),
                y: CGFloat(self.menuScrollViewH - 5),
                width: CGFloat(DeviceSize.screenWidth() / 3),
                height: CGFloat(self.slidingLabelH)
            )
        })
        
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
