//
//  HomeViewController.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/10.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
    }

    @IBAction func nextAction(_ sender: Any) {
        self.navigationController?.pushViewController(BarViewController(), animated: true)
    }

}
