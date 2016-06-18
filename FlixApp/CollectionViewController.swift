//
//  CollectionViewController.swift
//  FlixApp
//
//  Created by Nancy Yao on 6/16/16.
//  Copyright © 2016 Nancy Yao. All rights reserved.
//

import UIKit
import MBProgressHUD

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let apiKey = "fe0bc5f627da8817426f458762d96d06"
        let url = NSURL(string: "http://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")
        let request = NSURLRequest(
            URL: url!,
            cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate: nil,
            delegateQueue: NSOperationQueue.mainQueue()
        )
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        let task: NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: { (dataOrNil, response, error) in

            MBProgressHUD.hideHUDForView(self.view, animated: true)
            
            if let data = dataOrNil {
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                    data, options:[]) as? NSDictionary {
                    print("response: \(responseDictionary)")
                    
                    self.movies = responseDictionary["results"] as? [NSDictionary]
                    self.collectionView.reloadData()
                }
            }
        })
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count }
        else {return 0}
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCollectionCell", forIndexPath: indexPath) as! MovieCollectionCell
        
        if let movie = movies?[indexPath.item] {
            if let posterPath = movie["poster_path"] as? String {
            let baseURL = "http://image.tmdb.org/t/p/w500"
                let imageURL = NSURL(string: baseURL + posterPath)
            
                cell.collectionImageView.setImageWithURL(imageURL!)}
        }
        return cell;
    }
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if let destinationViewController = segue.destinationViewController as? DetailViewController {
            let indexPath = collectionView.indexPathForCell(sender as! UICollectionViewCell)
            let movie = movies![indexPath!.item]
            if let posterPath = movie["poster_path"] as? String {
                destinationViewController.photoUrl = posterPath
                let title = movie["title"] as! String
                destinationViewController.detailTitle = title }
        }
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
