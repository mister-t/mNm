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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = searchResultsTableView.dequeueReusableCellWithIdentifier("SearchResultCell", forIndexPath: indexPath) as! SearchResultCell
        cell.textLabel!.text = "This is row \(indexPath.row)"
        
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
        
        // Get the index path from the cell that was tapped
        let indexPath = searchResultsTableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        let index = indexPath?.row
        // Get in touch with the DetailViewController
        let detailViewController = segue.destinationViewController as! MentorProfileViewController
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        detailViewController.index = index              }


}
