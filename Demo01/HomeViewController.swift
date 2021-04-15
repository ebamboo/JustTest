//
//  HomeViewController.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/10.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let titleList = ["导航栏、状态栏设置", "Scroll View Header",
                     "系统原生分享", "文件预览、打开、分享",
                     "UIPageViewController", "悬浮可滑动按钮"
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
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
    }
    
}
