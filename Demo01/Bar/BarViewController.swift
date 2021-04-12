//
//  BarViewController.swift
//  Demo01
//
//  Created by 征国科技 on 2021/4/12.
//

import UIKit

class BarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView: UITableView = {
        let view = UITableView()
        view.contentInsetAdjustmentBehavior = .never
        view.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return view
    }()
    
    // MARK: - life circle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let color = UIColor.white.withAlphaComponent(0.0)
        self.navigationController?.navigationBar.setBackgroundImage(self.image(with: color), for: .default)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let color = UIColor.white.withAlphaComponent(1.0)
        self.navigationController?.navigationBar.setBackgroundImage(self.image(with: color), for: .default)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        title = "bar test"
        view.backgroundColor = UIColor.systemGroupedBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    // MARK: - table view
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = String.init(indexPath.row)
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
        tableView.deselectRow(at: indexPath, animated: false)
        let barTestVC = BarTestViewController()
        barTestVC.modalPresentationStyle = .fullScreen
        self.present(barTestVC, animated: true, completion: nil)
    }
    
    // MARK: - scroll view
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print("\(offsetY)")
        if offsetY < 0 {
            let color = UIColor.white.withAlphaComponent(0.0)
            self.navigationController?.navigationBar.setBackgroundImage(self.image(with: color), for: .default)
            return
        }
        if offsetY > 300 {
            let color = UIColor.white.withAlphaComponent(1.0)
            self.navigationController?.navigationBar.setBackgroundImage(self.image(with: color), for: .default)
            return
        }
        let color = UIColor.white.withAlphaComponent(offsetY/300)
        self.navigationController?.navigationBar.setBackgroundImage(self.image(with: color), for: .default)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    // MARK: - private method
    
    func image(with color: UIColor) -> UIImage {
        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
    }

}
