//
//  ViewController.swift
//  IndividualProject
//
//  Created by Kate Owens  on 11/2/15.
//  Copyright © 2015 Me. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIToolbarDelegate, UIAlertViewDelegate, UIScrollViewDelegate  {
    
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var dragImage: UIImageView?
    
    let draggableImage = UIPanGestureRecognizer()
    
    
    @IBOutlet weak var userImageView: UIImageView?
    
    let imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var pinchView: UIImageView!
    
    let pinchRec = UIPinchGestureRecognizer()
    
    // make some changes

    @IBOutlet weak var pinchViewTwo: UIImageView!
    
    let pinchRecTwo = UIPinchGestureRecognizer()
    
    
    @IBOutlet weak var rotateView: UIImageView!
    
    let rotateImage = UIRotationGestureRecognizer()
    
    var lastRotation = CGFloat()
    
    var scrollViewForUserImage = UIScrollView!()
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        
        //drag image uigesturerecognizer
        draggableImage.addTarget(self, action: "draggedView:")
        dragImage!.addGestureRecognizer(draggableImage)
        dragImage!.userInteractionEnabled = true
        
        //pinch to resize image uigesturerecognizer
        pinchRec.addTarget(self, action: "pinchedView:")
        pinchView.addGestureRecognizer(pinchRec)
        pinchView.userInteractionEnabled = true
        pinchView.multipleTouchEnabled = true
        
        pinchRecTwo.addTarget(self, action: "pinchedView:")
        pinchViewTwo.addGestureRecognizer(pinchRecTwo)
        pinchViewTwo.userInteractionEnabled = true
        pinchViewTwo.multipleTouchEnabled = true
        
        //rotate image uigesturerecognizer
        rotateImage.addTarget(self, action: "rotatedView:")
        rotateView.addGestureRecognizer(rotateImage)
        rotateView.userInteractionEnabled = true
        rotateView.multipleTouchEnabled = true
        
        //imagepicker for camera and photo library access
        imagePicker.delegate = self
            
        dragImage?.contentMode = UIViewContentMode.ScaleAspectFill
//        userImageView?.contentMode = UIViewContentMode.ScaleAspectFit
//        userImageView?.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin; UIViewAutoresizing.FlexibleHeight;UIViewAutoresizing.FlexibleRightMargin; UIViewAutoresizing.FlexibleLeftMargin; UIViewAutoresizing.FlexibleTopMargin; UIViewAutoresizing.FlexibleWidth
//        
//        mainScrollView = UIImage(named: "defaultBackground")
        
//        scrollView = UIScrollView(frame: userImageView!.bounds)
//        scrollView.backgroundColor = UIColor.blackColor()
//        scrollView.contentSize = userImageView!.bounds.size
//        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
//        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
       
            
//        view.addSubview(uiscrollview)
//        scrollView.addSubview(userImageView!)
//
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.showsVerticalScrollIndicator = false
//        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
  
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    
    
    func draggedView(sender: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(sender.view!)
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
        
    }
    
    @IBAction  func addUserImagePicker(sender: UIButton) {
        let actionSheetController = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action ->Void in
        } 
        actionSheetController.addAction(cancelAction)

        let addImageFromGalleryAction: UIAlertAction = UIAlertAction(title: "Add from Library", style: .Default)  { action ->Void in
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(self.imagePicker, animated: true,completion: nil)
        
    }
        actionSheetController.addAction(addImageFromGalleryAction)

    let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .Camera
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
        actionSheetController.addAction(takePictureAction)
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
}
    
    
    func pinchedView(sender:UIPinchGestureRecognizer){
        self.view.bringSubviewToFront(pinchView)
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1.0
        
        
    }
    
    func pinchedViewTwo(sender: UIPinchGestureRecognizer) {
        self.view.bringSubviewToFront(pinchViewTwo)
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform, sender.scale, sender.scale)
        sender.scale = 1.0
    }
    
    func rotatedView(sender:UIRotationGestureRecognizer){
        var lastRotation = CGFloat()
        var velocity = CGFloat(0.5)

        self.view.bringSubviewToFront(rotateView)
        if(sender.state == UIGestureRecognizerState.Ended){
            lastRotation = 0.0;
        }
        
        var rotation = 0.0 - (lastRotation - sender.rotation)
        var point = rotateImage.locationInView(rotateView)
        var currentTrans = sender.view!.transform
        let newTrans = CGAffineTransformRotate(currentTrans, rotation)
        sender.view!.transform = newTrans
        lastRotation = sender.rotation
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userImageView!.contentMode = .ScaleAspectFit
            userImageView!.image = pickedImage
        }
        
        dismissViewControllerAnimated(true) {
            
        }
    }

    @IBAction func unwindToVC(segue:UIStoryboardSegue) {
        if(segue.sourceViewController .isKindOfClass(FrancoCollectionCollectionViewController))
        {
            let francoCollectionView:FrancoCollectionCollectionViewController = segue.sourceViewController as! FrancoCollectionCollectionViewController
            let selectedImageFromLibrary = selectedFranco
            dragImage!.image = UIImage(named: selectedImageFromLibrary)
        }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func takeNewPhoto(sender: UIButton) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.cameraCaptureMode = .Photo
        }
            
        else if UIImagePickerController.availableCaptureModesForCameraDevice(.Front) != nil {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.cameraCaptureMode = .Photo
            }
        }
    
    }

          //alert when photo is saved
    func savedImageAlert() {
        var alert: UIAlertView = UIAlertView()
        alert.title = "Saved!"
        alert.message = "Your Franco File has been saved!"
        alert.delegate = self
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    
    
    

    @IBAction func mergeAndSaveImage(sender: AnyObject) {
//        let newImage = imageWithView(myView)
//        UIImageWriteToSavedPhotosAlbum(finalImage, nil, nil, nil)
        
        
        // takes a screenshot of the uiscreen
        
        UIGraphicsBeginImageContextWithOptions(userImageView!.bounds.size, false, 0.0)
        self.userImageView!.drawViewHierarchyInRect(userImageView!.bounds, afterScreenUpdates: true)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        //saved image alert
        self.savedImageAlert()
        self.dismissViewControllerAnimated(true, completion: nil)

//    let finalImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()

}
}