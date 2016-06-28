//
//  MentorProfileViewController.swift
//  mNm
//
//  Created by Tony Yeung on 6/26/16.
//  Copyright © 2016 Tony Yeung. All rights reserved.
//

import UIKit

class MentorProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackBtnTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    @IBOutlet weak var onSendRequest: UIButton!

    @IBAction func onSendRequest(sender: AnyObject) {
        let alertController = UIAlertController(title: "Request Sent", message:
            "Mentor 1 will be notified", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
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
