//
//  ModelTestViewController01.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/17.
//

import UIKit

class ModelTestViewController01: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "自定义模态动画"
    }
    
    @IBAction func testAction(_ sender: Any) {
        let vc02 = ModelTestViewController02()
        self.present(vc02, animated: true, completion: nil)
    }
    
}
