//
//  BarTestViewController.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/12.
//

import UIKit

class BarTestViewController: UIViewController {
    
    /// 状态栏 隐藏与否、样式 在有导航栏的控制器设置无效
    /// 通过该方法  self.navigationController?.setNavigationBarHidden(true, animated: false)
    /// 隐藏导航栏也可以使状态栏的相关设置生效
    /// 该方法弊端很大，慎重使用
    /// 可以通过 self.navigationController?.navigationBar.isHidden = true 这个途径达到隐藏导航栏目的
    /// 但是状态栏的设置无效
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.dismiss(animated: true, completion: nil)
    }
}
