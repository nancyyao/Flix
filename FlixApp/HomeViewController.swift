//
//  HomeViewController.swift
//  FlixApp
//
//  Created by Nancy Yao on 6/17/16.
//  Copyright © 2016 Nancy Yao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var homeView: UIView!
    var movies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
        