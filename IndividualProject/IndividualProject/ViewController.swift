//
//  ViewController.swift
//  IndividualProject
//
//  Created by Kate Owens  on 11/2/15.
//  Copyright © 2015 Me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    
var selectedIndex = 0
    
    @IBOutlet weak var dragImage: UIImageView?
    let draggableImage = UIPanGestureRecognizer()
    
    @IBOutlet weak var userImageView: UIImageView?
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var pinchView: UIImageView!
    let pinchRec = UIPinchGestureRecognizer()

    @IBOutlet weak var pinchViewTwo: UIImageView!
    let pinchRecTwo = UIPinchGestureRecognizer()
    
    @IBOutlet weak var rotateView: UIImageView!
    let rotateImage = UIRotationGestureRecognizer()
    var lastRotation = CGFloat()

    
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
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
   
    func draggedView(sender: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(sender.view!)
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    @IBAction  func addUserImagePicker(sender: UIButton) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction  func takeNewPhoto(sender: UIButton) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
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
    
    func takeANewPhoto(sender: UIButton) {
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
}