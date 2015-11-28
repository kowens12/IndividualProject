//
//  FrancoCollectionCollectionViewController.swift
//  IndividualProject
//
//  Created by Kate Owens  on 11/5/15.
//  Copyright © 2015 Me. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"
var selectedFranco = String()




class FrancoCollectionCollectionViewController: UICollectionViewController  {
    


    var francoPhotos = [String]()
    var indexPath = NSIndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       // self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
                
        francoPhotos = ["fancopractice", "francopractice2", "francopractice3", "francopractice4", "francopractice5", "francopractice6", "francopractice7", "francopractice8", "francopractice9", "francopractice10", "francopractice11", "francopractice12", "francopractice13", "francopractice14", "francopractice15", "francopractice16", "francopractice17", "francopractice18"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.

    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return francoPhotos.count 
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FrancoCellCollectionViewCell
    
        // sets each cell of collection view to be a uiimage view of francoPhotos
    
        let image = UIImage(named: francoPhotos[indexPath.row])
        cell.francoImageCell.image = image
        
        return cell
    }
    
    // highlights cell when touched 
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedFranco = francoPhotos[indexPath.row]
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell!.layer.borderWidth = 3.0
        cell!.layer.borderColor = UIColor.blueColor().CGColor

        
}
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell!.layer.borderWidth = 0.0
        cell!.layer.borderColor = UIColor.clearColor().CGColor
    }

    
    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
////    

    

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
}