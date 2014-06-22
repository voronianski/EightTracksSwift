//
//  LoginModalPresentationTransition.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 22.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

class LoginModalPresentationTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        return 0.72
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as LoginModalViewController
        
        toVC.transitioningBackgroundView.backgroundColor = UIColor.darkGrayColor()
        toVC.transitioningBackgroundView.alpha = 0.0
        toVC.transitioningBackgroundView.frame = UIScreen.mainScreen().bounds
        
        let containerView = transitionContext.containerView()
        containerView.addSubview(toVC.transitioningBackgroundView)
        containerView.addSubview(toVC.view)
        
        let toViewFrame = CGRectMake(0, 0, 280, 240)
        toVC.view.layer.cornerRadius = 5.0
        toVC.view.frame = toViewFrame
        
        let finalCenter = CGPointMake(fromVC.view.bounds.size.width / 2, toViewFrame.size.height / 2 + 25)
        toVC.view.center = CGPointMake(fromVC.view.frame.width / 2, finalCenter.y - 1000)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext),
            delay: 0.0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.25,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                toVC.view.center = finalCenter
                toVC.transitioningBackgroundView.alpha = 0.8
            },
            completion: { finished in
                toVC.view.center = finalCenter
                transitionContext.completeTransition(true)
            })
    }
}
