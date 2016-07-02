//
//  MentorProfileViewController.swift
//  mNm
//
//  Created by Tony Yeung on 6/26/16.
//  Copyright © 2016 Tony Yeung. All rights reserved.
//

import UIKit

class MentorProfileViewController: UIViewController {

    @IBOutlet weak var mentorLabel: UILabel!
    
    @IBOutlet weak var expertiseLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    var mentor: NSDictionary!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let name        = mentor["name"] as! String
        let expertise   = mentor["expertise"] as! String
        let job         = mentor["job"] as! String
        let company     = mentor["company"] as! String
        
        mentorLabel.text    = "Mentor: \(name)"
        expertiseLabel.text = "Expertise: \(expertise)"
        jobLabel.text       = "Job: \(job)"
        companyLabel.text   = "Company: \(company)"
        
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
