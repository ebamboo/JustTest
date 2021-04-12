//
//  HomeViewController.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/10.
//

import UIKit

class HomeViewController: UIViewController {

    let nextBtn: UIButton = {
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 44))
        btn.setTitle("next", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor.gray
        btn.addTarget(self, action: #selector(nextAction(sender:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = UIColor.systemGroupedBackground
        view.addSubview(nextBtn)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        nextBtn.center = view.center
    }
    
    @objc func nextAction(sender: Any) {
        self.navigationController?.pushViewController(BarViewController(), animated: true)
    }

}
