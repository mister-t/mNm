//
//  RecordingViewController.swift
//  mNm
//
//  Created by Sumit Kohli on 7/10/16.
//  Copyright © 2016 Tony Yeung. All rights reserved.
//

import UIKit
import MobileCoreServices
import MessageUI
class RecordingViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    func startCameraFromViewController(viewController: UIViewController, withDelegate delegate: protocol<UIImagePickerControllerDelegate, UINavigationControllerDelegate>) -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) == false {
            return false
        }
        
        var cameraController = UIImagePickerController()
        cameraController.sourceType = .Camera
        cameraController.mediaTypes = [kUTTypeMovie as NSString as String]
        cameraController.allowsEditing = false
        cameraController.delegate = delegate
        
        presentViewController(cameraController, animated: true, completion: nil)
        return true
    }
    func video(videoPath: NSString, didFinishSavingWithError error: NSError?, contextInfo info: AnyObject) {
        var title = "Sent"
        var message = "Your message was sent to Mark Webber"
        if let _ = error {
            title = "Error"
            message = "Video failed to save"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     startButton.backgroundColor = UIColor.grayColor()
     finishButton.backgroundColor = UIColor.grayColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func recordTapped(sender: AnyObject) {
        startCameraFromViewController(self, withDelegate: self)
    }
    @IBAction func sendEmailButtonTapped(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["mentor@gmail.com"])
        mailComposerVC.setSubject("Task:Read Supply Chain Book")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSendTap(sender: AnyObject) {
        if startButton.backgroundColor == UIColor.grayColor() {
            startButton.backgroundColor = UIColor(red: 48/255, green: 167/255, blue: 130/255, alpha: 1)
        }
        else if startButton.backgroundColor == UIColor(red: 48/255, green: 167/255, blue: 130/255, alpha: 1) {
            startButton.backgroundColor = UIColor.grayColor()
        }
        
    }
    
    @IBAction func onFinishTap(sender: AnyObject) {
        if finishButton.backgroundColor == UIColor.grayColor() {
            finishButton.backgroundColor = UIColor(red: 48/255, green: 167/255, blue: 130/255, alpha: 1)
        }
        else if finishButton.backgroundColor == UIColor(red: 48/255, green: 167/255, blue: 130/255, alpha: 1) {
            finishButton.backgroundColor = UIColor.grayColor()
        }
    }
    
}
extension RecordingViewController: UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        dismissViewControllerAnimated(true, completion: nil)
        // Handle a movie capture
        if mediaType == kUTTypeMovie {
            guard let path = (info[UIImagePickerControllerMediaURL] as! NSURL).path else { return }
            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(path) {
                UISaveVideoAtPathToSavedPhotosAlbum(path, self, #selector(RecordingViewController.video(_:didFinishSavingWithError:contextInfo:)), nil)
            }
        } 
    }
}

extension RecordingViewController: UINavigationControllerDelegate {
}
