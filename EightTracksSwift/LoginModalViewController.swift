//
//  LoginModalViewController.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 21.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

class LoginModalViewController: UIViewController {
    
    @IBOutlet var usernameField : UITextField
    @IBOutlet var passwordField : UITextField
    @IBOutlet var loginButton : UIButton
    
    var transitioningBackgroundView = UIView()
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customizeView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var gestureRecognizer = UITapGestureRecognizer()
        transitioningBackgroundView.addGestureRecognizer(gestureRecognizer)
        gestureRecognizer.addTarget(self, action: Selector("dismiss"))
        
        transitioningBackgroundView.userInteractionEnabled = true
        usernameField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        usernameField.resignFirstResponder()
    }
    
    func customizeView() {
        let radius:CGFloat = 3.0
        
        let paddingEmail = UIView(frame: CGRectMake(0, 0, 10, 38))
        usernameField.leftView = paddingEmail
        usernameField.leftViewMode = UITextFieldViewMode.Always
        usernameField.layer.cornerRadius = radius
        
        let paddingPass = UIView(frame: CGRectMake(0, 0, 10, 38))
        passwordField.leftView = paddingPass
        passwordField.leftViewMode = UITextFieldViewMode.Always
        passwordField.layer.cornerRadius = radius
        
        loginButton.layer.cornerRadius = radius
    }
    
    func dismiss() {
        self.dismissModalViewControllerAnimated(true)
    }
    
    @IBAction func login(sender : AnyObject) {
        // api manager request to 8tracks
    }

    @IBAction func cancel(sender : AnyObject) {
        self.dismiss()
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
