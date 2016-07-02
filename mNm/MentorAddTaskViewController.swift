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
    @IBOutlet weak var tasksView: UIView!
    
    @IBOutlet weak var addTaskButton: UIButton!
    var initialY: CGFloat!
    var initialYBtn: CGFloat!

     var offset: CGFloat!
    var offsetBtn: CGFloat!
    
    
    func keyboardWillShow(notification: NSNotification!) {
        tasksView.frame.origin.y = initialY + offset
        addTaskButton.frame.origin.y = initialYBtn + offsetBtn
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
       tasksView.frame.origin.y = initialY
        addTaskButton.frame.origin.y = initialYBtn

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initialY = tasksView.frame.origin.y
        initialYBtn = addTaskButton.frame.origin.y

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
