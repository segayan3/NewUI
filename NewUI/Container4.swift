//
//  Container4.swift
//  NewUI
//
//  Created by Naohiro Segawa on 2016/12/24.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class Container4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // モグモグ期を表示
        setUp()
    }

    // モグモグ期を表示
    func setUp() {
        print("モグモグ期")
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
