//
//  ForgotPasswordViewController.swift
//  mNm
//
//  Created by Tony Yeung on 6/28/16.
//  Copyright © 2016 Tony Yeung. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var sendView: UIView!
    var initialY: CGFloat!
    //var initialYBtn: CGFloat!
    
    var offset: CGFloat!
    //var offsetBtn: CGFloat!
    func keyboardWillShow(notification: NSNotification!) {
        sendView.frame.origin.y = initialY + offset
        //buttonView.frame.origin.y = initialYBtn + offsetBtn
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        sendView.frame.origin.y = initialY
       // buttonView.frame.origin.y = initialYBtn
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialY = sendView.frame.origin.y
        //initialYBtn = buttonView.frame.origin.y
        
        offset = -250
        //offsetBtn = -250
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackBtnTappled(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }

    
    @IBAction func onSendTap(sender: AnyObject) {
        //self.activityIndicator.startAnimating()
        sendButton.selected = true
        
        let alertController = UIAlertController(title: "Email Sent", message: "Please follow the instructiosns in an email to reset your password", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
        
    }
    @IBAction func editingChanged(sender: AnyObject) {
        if emailField.text!.isEmpty  {
            // set the button state to disabled
            sendButton.enabled = false
            // otherwise
        } else {
            // set the button state to enabled
            sendButton.enabled = true
        }
    }

}
