//
//  ViewController.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit
import ESTabBarController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ESTabBarControllerでグローバルタブを設定
        setUpTab()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ESTabBarControllerでグローバルタブを設定
    func setUpTab() {
        
        // 画像ファイル名を指定してESTabBarControllerを作成
        let tabBarController: ESTabBarController = ESTabBarController(tabIconNames: ["home", "home", "home", "home"])
        
        // グローバルタブの背景色、選択時の色を設定
        tabBarController.selectedColor = UIColor(
            red: 1.0,
            green: 0.44,
            blue: 0.11,
            alpha: 1
        )
        
        tabBarController.buttonsBackgroundColor = UIColor(
            red: 0.96,
            green: 0.91,
            blue: 0.87,
            alpha: 1
        )
        
        // 作成したESTabBarControllerをこのViewControllerに配置
        addChildViewController(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.view.frame = view.frame
        tabBarController.didMove(toParentViewController: self)
        
        // タブをタップした時に表示するViewControllerを設定
        let recipeViewController = storyboard?.instantiateViewController(withIdentifier: "Recipe")
        let searchViewController = storyboard?.instantiateViewController(withIdentifier: "Search")
        let likeViewController = storyboard?.instantiateViewController(withIdentifier: "Like")
        let myPageViewController = storyboard?.instantiateViewController(withIdentifier: "MyPage")
        
        // 各タブに識別番号を割り振り
        tabBarController.setView(recipeViewController, at: 0)
        tabBarController.setView(searchViewController, at: 1)
        tabBarController.setView(likeViewController, at: 2)
        tabBarController.setView(myPageViewController, at: 3)
    }

}

