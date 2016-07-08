//
//  LoginViewController.swift
//  mNm
//
//  Created by Tony Yeung on 6/28/16.
//  Copyright © 2016 Tony Yeung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var initialY: CGFloat!
    var offset: CGFloat!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var loginBtn: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    func keyboardWillShow(notification: NSNotification!) {
        taskView.frame.origin.y = initialY + offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        taskView.frame.origin.y = initialY
    }
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      initialY = taskView.frame.origin.y
        offset = -250
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackBtnTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }

    @IBAction func didPressLogin(sender: AnyObject) {
        activityIndicator.startAnimating()
        loginButton.selected = true
        if emailField.text == "abc@walmart.com" && passwordField.text == "abc123" {
            
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.activityIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("yourSegue", sender: nil)
            })
        } else {
            // Delay for 2 second
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.activityIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                let alertController = UIAlertController(title: "Incorrect Email/Password", message: "Email or Password you entered does not match our records", preferredStyle: .Alert)
                
                //        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                //            // handle cancel response here. Doing nothing will dismiss the view.
                //        }
                //        // add the cancel action to the alertController
                //        alertController.addAction(cancelAction)
                //
                //        // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }

            })
            
        }
    }
    

}
