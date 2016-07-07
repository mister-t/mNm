//
//  MentorAddTaskViewController.swift
//  mNm
//
//  Created by Tony Yeung on 6/28/16.
//  Copyright © 2016 Tony Yeung. All rights reserved.
//

import UIKit

class MentorAddTaskViewController: UIViewController {
    
    //let frame = notification.userInfo![UIKeyboardFrameEndUserInfoKey].CGRectValue()
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var tasksView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var addTaskButton: UIButton!
    var initialY: CGFloat!
    var initialYBtn: CGFloat!

     var offset: CGFloat!
    var offsetBtn: CGFloat!
    
    
    func keyboardWillShow(notification: NSNotification!) {
        tasksView.frame.origin.y = initialY + offset
        buttonView.frame.origin.y = initialYBtn + offsetBtn
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
       tasksView.frame.origin.y = initialY
        buttonView.frame.origin.y = initialYBtn

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initialY = tasksView.frame.origin.y
        initialYBtn = buttonView.frame.origin.y

        offset = -50
        offsetBtn = -250
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

    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)

    }
    
    
    
    @IBAction func onButtonClick(sender: AnyObject) {
        self.activityIndicator.startAnimating()
        addTaskButton.selected = true
        
        let alertController = UIAlertController(title: "Success", message: "A new task has been Added", preferredStyle: .Alert)

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
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }
 
    @IBAction func editingChanged(sender: AnyObject) {
        if titleText.text!.isEmpty || descriptionText.text!.isEmpty {
            // set the button state to disabled
            addTaskButton.enabled = false
            // otherwise
        } else {
            // set the button state to enabled
            addTaskButton.enabled = true
        }
    }
        
        
        
}
    


