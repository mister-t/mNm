//
//  SearchMentorViewController.swift
//  mNm
//
//  Created by Tony Yeung on 6/26/16.
//  Copyright © 2016 Tony Yeung. All rights reserved.
//

import UIKit

class SearchMentorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    
    @IBOutlet weak var searchResultsTableView: UITableView!

    let url = NSBundle.mainBundle().URLForResource("mentors", withExtension: "json") //get the JSON in the "Resource" folder
    var data: NSData?
    var mentors: [NSDictionary]?
    
    func readJSONObject(object: [String: AnyObject]) {
         mentors = object["mentors"] as? [NSDictionary]
        
        for mentor in mentors! {
            guard let name = mentor["name"] as? String else { break }
            print("Mentor Name: " + name)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = NSData(contentsOfURL: url!)
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                readJSONObject(dictionary)
            }
        } catch {
            print("error while reading JSON")
            // Handle Error
        }
        
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let mentors = mentors {
            return mentors.count
        } else {
         return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = searchResultsTableView.dequeueReusableCellWithIdentifier("SearchResultCell", forIndexPath: indexPath) as! SearchResultCell
        if let mentors = mentors {
            cell.textLabel!.text = mentors[indexPath.row]["name"] as? String
        } else {
            cell.textLabel!.text = "Unknown"
        }

        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var onBackBtnTapped: UIButton!

    @IBAction func onBackBtnTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Mentors"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed; http://stackoverflow.com/questions/28471164/how-to-set-back-button-text-in-swift

        let cell = sender as! UITableViewCell
        let indexPath = searchResultsTableView.indexPathForCell(cell)
        let mentor = mentors![indexPath!.row]
        
        let detailViewController = segue.destinationViewController as! MentorProfileViewController
        detailViewController.mentor = mentor
    }


}
