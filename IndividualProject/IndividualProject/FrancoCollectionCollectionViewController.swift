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
        
        francoPhotos = ["fancopractice", "francopractice2", "francopractice3", "francopractice4", "francopractice5", "francopractice6", "francopractice7", "francopractice8", "francopractice9", "francopractice10", "francopractice11", "francopractice12", "francopractice13", "francopractice14", "francopractice15", "francopractice16", "francopractice17", "francopractice18"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
        performSegueWithIdentifier("addFranco", sender: self) 
}
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        cell!.layer.borderWidth = 0.0
        cell!.layer.borderColor = UIColor.clearColor().CGColor
    }

    
    // MARK: UICollectionViewDelegate


}