//
//  HomeViewController.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/10.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let titleList = [
        "导航栏、状态栏设置", "Scroll View Header",
        "系统原生分享", "文件预览、打开、分享",
        "UIPageViewController", "悬浮可滑动按钮",
        "自定义模态动画", "Keychain 使用封装",
        "NSTread利用runloop保活和销毁", "实时检测输入框是否合法",
        "视图颜色渐变CAGradientLayer", "自定义 UICollectionViewFlowLayout",
        "原生UICollectionView拖动动画", "Xib或Storyboard添加Object"
    ]
    
    // MARK: - life cirle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = UIColor.systemGroupedBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let frame = CGRect.init(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top, width: view.bounds.size.width - view.safeAreaInsets.left - view.safeAreaInsets.right, height: view.bounds.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        tableView.frame = frame
    }
    
    // MARK: - table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = titleList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            navigationController?.pushViewController(BarViewController(), animated: true)
            return
        }
        if indexPath.row == 1 {
            let homeSB = UIStoryboard.init(name: "HomeModule", bundle: nil)
            let scrollViewHeaderVC = homeSB.instantiateViewController(identifier: "ScrollViewHeaderViewController")
            navigationController?.pushViewController(scrollViewHeaderVC, animated: true)
            return
        }
        if indexPath.row == 2 {
            navigationController?.pushViewController(SystemShareViewController(), animated: true)
            return
        }
        if indexPath.row == 3 {
            navigationController?.pushViewController(FileOpeningViewController(), animated: true)
            return
        }
        if indexPath.row == 4 {
            let homeSB = UIStoryboard.init(name: "HomeModule", bundle: nil)
            let pageVC = homeSB.instantiateViewController(identifier: "PageViewController")
            navigationController?.pushViewController(pageVC, animated: true)
            return
        }
        if indexPath.row == 5 {
            navigationController?.pushViewController(SuspensionViewController(), animated: true)
            return
        }
        if indexPath.row == 6 {
            navigationController?.pushViewController(ModelTestViewController01(), animated: true)
            return
        }
        if indexPath.row == 7 {
            navigationController?.pushViewController(KeychainViewController(), animated: true)
            return
        }
        if indexPath.row == 8 {
            navigationController?.pushViewController(ThreadTestViewController02(), animated: true)
            return
        }
        if indexPath.row == 9 {
            navigationController?.pushViewController(InputTestViewController(), animated: true)
            return
        }
        if indexPath.row == 10 {
            navigationController?.pushViewController(GradientTestViewController(), animated: true)
            return
        }
        if indexPath.row == 11 {
            navigationController?.pushViewController(FLowLayoutTestViewController(), animated: true)
            return
        }
        if indexPath.row == 12 {
            navigationController?.pushViewController(CollectionViewPanTestViewController(), animated: true)
            return
        }
        if indexPath.row == 13 {
            navigationController?.pushViewController(ObjectFromNibTestViewController(), animated: true)
            return
        }
    }
    
}
