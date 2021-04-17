//
//  ModelTestViewController01.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/17.
//

import UIKit

class ModelTestViewController01: UIViewController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func testAction(_ sender: Any) {
        
        ///
        /// ！！！！！！模态动画是在被推出视图 presentedViewController 上定义的！！！！！！
        /// 具体而言：
        /// 当 present 时，toViewController 定义动画
        /// 当 dismiss 时，fromViewController 定义动画
        /// 总结：只需 presentedViewController 指明 transitioningDelegate 代理即可
        ///
        
        let vc02 = ModelTestViewController02()
        // vc02 通过 UIViewControllerTransitioningDelegate 协议获取 vc02 的转场动画管理者
        // 只要实现 UIViewControllerTransitioningDelegate 的对象都可以，也可以在 vc02 内部实现
        vc02.transitioningDelegate = self
        // 必须设置为 custom 类型，只要这样维持正确的视图栈，不会出现黑屏相关的问题
        vc02.modalPresentationStyle = .custom
        self.present(vc02, animated: true, completion: nil)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModelAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModelAnimator()
    }
    
}
