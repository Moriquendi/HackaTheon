//
//  CardTransition.swift
//  HackaTheon
//
//  Created by Michal Smialko on 09/04/16.
//  Copyright © 2016 Michal Smialko. All rights reserved.
//

import UIKit

class CardTransition: NSObject,
UIViewControllerAnimatedTransitioning {

    var presenting = false
    let scale = CGFloat(1.2)
    var startCardFrame = CGRectZero
    

    // MARK: UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if (self.presenting) {
            self.animatePresenting(transitionContext)
        }
        else {
            self.animateDismissing(transitionContext)
        }
    }
    
    // MARK:
    
    func animatePresenting(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! UINavigationController
        let container = transitionContext.containerView()!
        
        let clippingView = UIView()
        clippingView.backgroundColor = UIColor.clearColor()
        clippingView.frame = self.startCardFrame
        clippingView.clipsToBounds = true
        clippingView.layer.cornerRadius = 7
        container.addSubview(clippingView)
        
        toVC.view.frame = clippingView.convertRect(container.bounds, fromView: container)
        clippingView.addSubview(toVC.view)
        
        let duration = self.transitionDuration(transitionContext)
        
        let rootVC = toVC.viewControllers.first!
        
        // Set up
        toVC.view.alpha = 0
        rootVC.view.layer.transform = CATransform3DMakeScale(scale, scale, 1)
        
        UIView.animateWithDuration(duration,
                                   delay: 0,
                                   usingSpringWithDamping: 0.7,
                                   initialSpringVelocity: 0,
                                   options: UIViewAnimationOptions.CurveEaseIn,
                                   animations:
            {
                clippingView.frame = container.bounds
                clippingView.layer.cornerRadius = 0
                toVC.view.frame = clippingView.bounds
                
                
                toVC.view.alpha = 1
                rootVC.view.layer.transform = CATransform3DIdentity
                fromVC.view.layer.transform = CATransform3DMakeScale(self.scale, self.scale, 1)
            })
        { (finished) in
            fromVC.view.layer.transform = CATransform3DIdentity
            container.addSubview(toVC.view)
            clippingView.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
    
    func animateDismissing(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as! UINavigationController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let rootVC = fromVC.viewControllers.last!
        let container = transitionContext.containerView()!
        let duration = self.transitionDuration(transitionContext)
        
        // Setup
        toVC.view.layer.transform = CATransform3DMakeScale(scale, scale, 1)
        
        let clippingView = UIView()
        clippingView.backgroundColor = UIColor.clearColor()
        clippingView.frame = container.bounds
        clippingView.clipsToBounds = true
        container.addSubview(clippingView)

        fromVC.view.frame = clippingView.bounds
        clippingView.addSubview(fromVC.view)
        
        
        UIView.animateWithDuration(duration,
                                   delay: 0,
                                   usingSpringWithDamping: 0.7,
                                   initialSpringVelocity: 0,
                                   options: UIViewAnimationOptions.CurveEaseIn,
                                   animations:
            {
                clippingView.frame = self.startCardFrame
                clippingView.layer.cornerRadius = 7
                fromVC.view.frame = container.convertRect(container.bounds, toView: clippingView)
                
                toVC.view.layer.transform = CATransform3DIdentity
                fromVC.view.transform = CGAffineTransformMakeScale(self.scale, self.scale)
                fromVC.view.alpha = 0
            })
        { (finished) in
            container.addSubview(fromVC.view)
            clippingView.removeFromSuperview()
            
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
    
    
    
}
