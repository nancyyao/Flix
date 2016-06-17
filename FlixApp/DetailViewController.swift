//
//  DetailViewController.swift
//  FlixApp
//
//  Created by Nancy Yao on 6/16/16.
//  Copyright © 2016 Nancy Yao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet var detailView: UIView!
    var photoUrl: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        largeImage.setImageWithURL(NSURL(string:photoUrl!)!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
