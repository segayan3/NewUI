//
//  Container1.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia

// MARK:- 動画プレイヤーを配置したビューをAVPlayerLayerにするためのラッパークラス
// これをsuperViewにaddSubViewする
// これがないと動画再生できない
class AVPlayerView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame) // frameのサイズを変えると動画プレイヤーのビューのサイズが変わる
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

class Container1: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // 動画再生用のアイテム
    var playerItem: AVPlayerItem! // 実際の動画内容を保存する変数
    // ビデオプレイヤー
    var videoPlayer: AVPlayer! // 動画再生プレイヤーを保存する変数    
    
    // データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    // データを返すメソッド
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0) {
            // collectionViewから識別子contentsCellのセルを取得する
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentsCell", for: indexPath) as! TopNewRecipeCollectionViewCell
            
            // セルの背景色を設定する
            cell.backgroundColor = UIColor.brown
            
            /*
             動画をビデオプレイヤーに表示しviewに貼り付ける処理
             */
            // 動画のファイル名と拡張子を変数に保存
            let fileName = "IMG_9333"
            let fileExtension = "MOV"
            
            // 動画へのパスからassetを生成
            let path = Bundle.main.path(forResource: fileName, ofType: fileExtension)
            let fileURL = URL(fileURLWithPath: path!)
            let avAsset = AVURLAsset(url: fileURL)
            
            // ビデオプレイヤーに再生させるアイテムを生成
            playerItem = AVPlayerItem(asset: avAsset)
            
            // 再生する動画を指定してビデオプレイヤーを生成
            videoPlayer = AVPlayer(playerItem: playerItem)
            
            // ビデオプレイヤーを配置するためのビューを生成
            let videoPlayerView = AVPlayerView(frame: CGRect(
                x: 0,
                y: 0,
                width: CGFloat(DeviceSize.screenWidth()),
                height: CGFloat(DeviceSize.screenWidth())
                )
            )
            
            // 動画の終了を監視してリピート再生するためのNotificationを設定
            NotificationCenter.default.addObserver(self, selector: #selector(videoDidFinished), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
            
            // videoPlayerViewをAVPlayerLayerにキャストしビデオプレイヤーを配置する
            let layer = videoPlayerView.layer as! AVPlayerLayer
            layer.videoGravity = AVLayerVideoGravityResizeAspect // 縦横ともちょうどよく収まる
            layer.player = videoPlayer
            
            // layerをバックグラウンドビューに配置する
            cell.videoBackGroundView.layer.addSublayer(layer)
            
            return cell
        }else{
            // collectionViewから識別子contentsCellのセルを取得する
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "otherContentsCell", for: indexPath) as! NewRecipeCollectionViewCell
            
            // セルに画像を設定する
            cell.newRecipeImageView.image = UIImage(named: "IMG_8889.JPG")
            cell.newRecipeImageView.layer.borderColor = UIColor.white.cgColor
            cell.newRecipeImageView.layer.borderWidth = 1
            
            
            return cell
        }
    }

    // セルがタップされた時に動作するメソッド
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // モーダルを表示
        let detailView = self.storyboard?.instantiateViewController(withIdentifier: "C3Detail") as! C3DetailViewController
        detailView.index = indexPath.row
        self.present(detailView, animated: true, completion: nil)
    }
    
    // 動画の終了を検知してリピート再生するメソッド
    func videoDidFinished() {
        
        // 再生中の動画の総再生時間を取得
        let duration = CMTimeGetSeconds(self.videoPlayer.currentItem!.duration)
        
        // 再生終了時間をCMTime型で取得
        let endTime = CMTimeMake(Int64(0.5), Int32(duration))
        
        // 動画終了を検知したらまた再生
        videoPlayer.seek(to: endTime, completionHandler: {_ in
            
            // 動画を再生
            self.videoPlayer.play()
        })
        return
    }
    
    // 画面が表示される直前に動作するメソッド
    override func viewDidAppear(_ animated: Bool) {
        
        // 画面が読み込まれたらトップの動画を再生
        videoPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
