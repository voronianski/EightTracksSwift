//
//  LoginModalViewController.swift
//  EightTracksSwift
//
//  Created by Dmitri Voronianski on 21.06.14.
//  Copyright (c) 2014 Dmitri Voronianski. All rights reserved.
//

import UIKit

class LoginModalViewController: UIViewController {
    
    @IBOutlet var usernameField : UITextField!
    @IBOutlet var passwordField : UITextField!
    @IBOutlet var loginButton : UIButton!
    
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
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func login(sender : AnyObject) {
        let username = usernameField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let password = passwordField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if (username.isEmpty || password.isEmpty) {
            self.showAlert("Make sure you enter username and password!")
            return
        }
        
        let api = APIManager.sharedInstance
        let app = UIApplication.sharedApplication()
        app.networkActivityIndicatorVisible = true
        
        println(username, password)
        
        func success(operation: NSURLSessionDataTask!, data: AnyObject!) {
            println("success")
            self.dismissViewControllerAnimated(true, {
                app.networkActivityIndicatorVisible = false
                //println(data.objectForKey("user"))
                println("segue to an app")
            })
        }
        func failure(operation: NSURLSessionDataTask?, error: NSError?) {
            app.networkActivityIndicatorVisible = false
            self.showAlert("Your login was unsuccessful")
        }
        api.login(username, password: password, success: success, failure: failure)
    }

    @IBAction func cancel(sender : AnyObject) {
        self.dismiss()
    }
    
    func showAlert(message: String) {
        let alertView = UIAlertController(title: "Oops", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertView, animated: true, completion: nil)
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
