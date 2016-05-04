//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Belén Molina del Campo on 04/05/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userList:[User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        print(userList)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell") as! UserTableViewCell
        let currentUser = userList[indexPath.row]
        cell.drawCell(currentUser)
        return cell
    }
    func loadUsers()
    {
        let session = NSURLSession.sharedSession()
        if let url = NSURL(string: "http://jsonplaceholder.typicode.com/users") {
            let task = session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
                if error == nil && (response as! NSHTTPURLResponse).statusCode == 200 {
                    do {
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? [[String: AnyObject]]
                        {
                            for userDictionary in json
                            {
                                let newUser = User(dictionary: userDictionary)
                                self.userList.append(newUser)
                            }
                            
                        }
                        
                        dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                            self.tableView.reloadData()
                        }
                    }catch{
                        print("There was an error")
                    }
                }
            })
            task.resume()
        }
        
    }

}

