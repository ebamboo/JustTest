//
//  RootTabBarController.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/10.
//

import UIKit

class RootTabBarController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    func setupUI() {
        /// 添加子视图控制器到 UITabBarController 中，并设置 tabBarItem 对应的标题、图片等。
        /// 注意1：self.navigationItem.title--sets navigation bar title.
        ///       self.tabBarItem.title--sets tab bar title.
        ///       self.title--sets both of these.
        /// 注意2：图片大小必须遵守规则，@3x 90*90，@2 60*60， @1 30*30
        let itemVCs = [HomeViewController(), MineViewController()]
        let itemTitles = ["主页", "我的"]
        let itemImages = ["tabbar-item-home", "tabbar-item-mine"]
        let itemSelectedImages = ["tabbar-item-home", "tabbar-item-mine"]
        for i in 0...1 {
            let itemVC = itemVCs[i]
            itemVC.tabBarItem.title = itemTitles[i]
            itemVC.tabBarItem.image = UIImage.init(named: itemImages[i])
            itemVC.tabBarItem.selectedImage = UIImage.init(named: itemSelectedImages[i])
            let itemNavi = UINavigationController.init(rootViewController: itemVC)
            self.addChild(itemNavi)
        }
        
        /// 设置 tabBar
        /// translucent:标签栏是否透明; barTintColor: 标签栏颜色（背景）; tintColor: 标签栏痕迹颜色
        /// 注意：痕迹颜色默认是标题和图片选中的颜色，图片可以设置 Render 为 UIImageRenderingModeAlwaysOriginal 取消痕迹颜色渲染，展示原图效果
        self.tabBar.isTranslucent = true
//        self.tabBar.barTintColor = UIColor.orange
        self.tabBar.tintColor = UIColor.systemPink
        
        /// UITabBarItem 设置不同状态下的文字属性
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], for: .normal)
    }

}
