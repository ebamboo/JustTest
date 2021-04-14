//
//  SystemShareViewController.swift
//  Demo01
//
//  Created by 征国科技 on 2021/4/14.
//

import UIKit

class SystemShareViewController: UIViewController {

    let testBtn: UIButton = {
        let view = UIButton.init(type: .custom)
        view.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        view.setTitle("share", for: .normal)
        view.backgroundColor = .gray
        view.addTarget(self, action: #selector(shareAction), for: .touchUpInside)
        return view
    }()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        testBtn.center = view.center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "系统原生分享"
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(testBtn)
    }
    
    @objc func shareAction() {
        let text = "分享的文字"
        let url = URL.init(string: "https://www.baidu.com")!
        let image = UIImage.init(named: "system-share-1")!
        let activityVC = UIActivityViewController.init(activityItems: [text, url, image], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }

}
