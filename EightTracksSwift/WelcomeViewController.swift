//
//  WelcomeViewController.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 16.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIViewControllerTransitioningDelegate {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let user = User()
        
        // for development purposes
        user.logout()
        if (user.isLogined()) {
            println("segue to nav controller")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showLogin(sender : AnyObject) {
        let loginVC = self.storyboard.instantiateViewControllerWithIdentifier("LoginModalViewController") as LoginModalViewController
        loginVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        loginVC.transitioningDelegate = self
        
        self.presentViewController(loginVC, animated: true, completion: nil)
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        return LoginModalPresentationTransition()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        return LoginModalDismissalTransition()
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
