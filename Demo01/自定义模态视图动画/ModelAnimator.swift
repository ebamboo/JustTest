//
//  ModelAnimator.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/17.
//

import UIKit

class ModelAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // MARK: - 第一步：获取相关视图和视图控制器
        let fVC = transitionContext.viewController(forKey: .from)
        let tVC = transitionContext.viewController(forKey: .to)
        let fView: UIView? = {
            // 该方法可能返回空 view 所以一定要判断
            if let view = transitionContext.view(forKey: .from) {
                return view
            } else {
                // 通过上述方法失败后可以从以下方式取 view
                return fVC?.view
            }
        }()
        let tView: UIView? = {
            if let view = transitionContext.view(forKey: .to) {
                return view
            } else {
                return tVC?.view
            }
        }()
        guard let fromVC = fVC,
              let toVC = tVC,
              let fromView = fView,
              let toView = tView
        else {
            return
        }
        
        // MARK: - 第二步：判断当前转场发生的具体形式
        let present = toVC.presentingViewController == fromVC
        let dismiss = fromVC.presentingViewController == toVC
        
        // MARK: - 第三步：根据不同场景执行不同动画
        if present {
            
            ///
            /// 注意：发生 present 转场时
            /// formView 已经在 containerView
            /// toView 还么有在 containerView
            /// 所以需要添加 toView 到 containerView
            ///
            
            transitionContext.containerView.addSubview(toView)
            let containerFrame = transitionContext.initialFrame(for: fromVC)
            toView.frame = containerFrame.offsetBy(dx: containerFrame.size.width, dy: 0)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext)) {
                toView.frame = containerFrame;
            } completion: { (finished) in
                // 上报转场结束并且是否成功情况，否则会认为还在转场 无法交互
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                if transitionContext.transitionWasCancelled {
                    // 取消时把要加入的 toView 移除
                    toView.removeFromSuperview()
                }
            }
        }
        if dismiss {
            
            ///
            /// 注意：发生 dismiss 转场时
            /// formView 和 toView 都已经在 containerView
            /// 所以不需要在去操作插入操作了
            ///
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext)) {
                let containerFrame = transitionContext.initialFrame(for: fromVC)
                fromView.frame = containerFrame.offsetBy(dx: containerFrame.width, dy: 0);
            } completion: { (finished) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
    
}
