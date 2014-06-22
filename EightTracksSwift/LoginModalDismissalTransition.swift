//
//  LoginModalDismissalTransition.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 22.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

class LoginModalDismissalTransition: NSObject, UIViewControllerAnimatedTransitioning {
   
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
        return 0.72
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as LoginModalViewController
        
        let finalCenter = CGPointMake(160, (fromVC.view.bounds.size.height / 2) - 1000)
        
        let options = UIViewAnimationOptions.CurveEaseOut
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext),
            delay: 0.0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.25,
            options: options,
            animations: {
                fromVC.view.center = finalCenter
                fromVC.transitioningBackgroundView.alpha = 0.0
            },
            completion: { finished in
                fromVC.view.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        )
    }
}
