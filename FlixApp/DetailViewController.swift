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
    @IBOutlet weak var detailTitleLabel: UILabel!
    var photoUrl: String?
    var detailTitle: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTitleLabel.text = detailTitle

        let smallImageUrl = "https://image.tmdb.org/t/p/w45" + photoUrl!
        let largeImageUrl = "https://image.tmdb.org/t/p/original" + photoUrl!
        let smallImageRequest = NSURLRequest(URL: NSURL(string: smallImageUrl)!)
        let largeImageRequest = NSURLRequest(URL: NSURL(string: largeImageUrl)!)
        self.largeImage.setImageWithURLRequest(
            smallImageRequest,
            placeholderImage: nil,
            success: { (smallImageRequest, smallImageResponse, smallImage) -> Void in
                
                // smallImageResponse will be nil if the smallImage is already available
                // in cache (might want to do something smarter in that case).
                self.largeImage.alpha = 0.0
                self.largeImage.image = smallImage;
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                    self.largeImage.alpha = 1.0
                    
                    }, completion: { (sucess) -> Void in
                        
                        // The AFNetworking ImageView Category only allows one request to be sent at a time
                        // per ImageView. This code must be in the completion block.
                        self.largeImage.setImageWithURLRequest(
                            largeImageRequest,
                            placeholderImage: smallImage,
                            success: { (largeImageRequest, largeImageResponse, largeImage) -> Void in
                                
                                self.largeImage.image = largeImage;
                                
                            },
                            failure: { (request, response, error) -> Void in
                                // do something for the failure condition of the large image request
                                // possibly setting the ImageView's image to a default image
                        })
                })
            },
            failure: { (request, response, error) -> Void in
                // do something for the failure condition
                // possibly try to get the large image
        })
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
