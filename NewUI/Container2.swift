//
//  Container2.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class Container2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 特集を表示
        setUp()
    }

    // 特集を表示
    func setUp() {
        print("特集")
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