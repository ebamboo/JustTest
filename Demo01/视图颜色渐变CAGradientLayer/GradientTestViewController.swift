//
//  GradientTestViewController.swift
//  Demo01
//
//  Created by ebamboo on 2021/12/10.
//

import UIKit

class GradientTestViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    var testGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        
        ///
        /// 每个位置对应该位置的颜色
        /// 第一个位置之前的颜色为第一个颜色
        /// 最后一个位置之后的颜色为最后一个颜色
        /// 位置之间即为过度颜色
        ///
        layer.colors = [UIColor.red.cgColor, UIColor.purple.cgColor, UIColor.black.cgColor]
        layer.locations = [0.2, 0.5, 0.8]
        
        ///
        /// 颜色过度渐变方向
        /// x, y 取值 [0, 1]
        ///
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 0)
        
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIView 颜色渐变"
        testView.layer .addSublayer(testGradientLayer)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        testGradientLayer.frame = testView.layer.bounds
    }

}
