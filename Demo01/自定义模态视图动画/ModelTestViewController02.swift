//
//  ModelTestViewController02.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/17.
//

import UIKit

class ModelTestViewController02: UIViewController, UIViewControllerTransitioningDelegate {
    
    ///
    /// UIPercentDrivenInteractiveTransition 是一个 Apple 为我们封装好的实现了 UIViewControllerInteractiveTransitioning 协议的类
    /// 我们可以直接或者通过继承使用它控制动画进程
    /// 注意它提供的三个方法
    /// update、cancel、finish
    ///
    let dismissalInteractor = UIPercentDrivenInteractiveTransition()
    
    // 标记是否是手势引起的 dismissal
    // 比如：可能是点击按钮引起 dismissal，也可能是手势滑动引起的
    var gestureDismssal: Bool!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        ///
        /// ！！！！！！模态动画是在被推出视图 presentedViewController 上定义的！！！！！！
        /// 具体而言：
        /// 当 present 时，toViewController 定义动画
        /// 当 dismiss 时，fromViewController 定义动画
        /// 总结：只需 presentedViewController 指明 transitioningDelegate 代理即可
        ///
        
        // 只要实现 UIViewControllerTransitioningDelegate 的对象都可以
        transitioningDelegate = self
        // 注意设置为 custom 和 fullScreen 异同点，防止出现黑屏相关的问题(参见视图层次关系)
        modalPresentationStyle = .custom
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 点击 dismiss
    @IBAction func testAction(_ sender: Any) {
        gestureDismssal = false
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // 左边边框侧滑 dismiss
    @IBAction func rightAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        gestureDismssal = true
        let translation = sender.translation(in: view.superview)
        let percentage = translation.x > 400 ? 1.0 : translation.x / 400
        switch sender.state {
        case .began:
            self.dismiss(animated: true, completion: nil)
        case .changed:
            dismissalInteractor.update(percentage)
        case .ended, .cancelled:
            if percentage > 0.5 {
                dismissalInteractor.finish()
            } else {
                dismissalInteractor.cancel()
            }
        default:
            return
        }
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModelAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModelAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        // 若不实现该方法或者该方法返回 nil 表示没有手势控制动画进度
        return gestureDismssal ? dismissalInteractor : nil
    }
    
}
