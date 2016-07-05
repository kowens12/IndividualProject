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
    
    
    let imagePicker = UIImagePickerController()
    
    
    
    var scrollViewForUserImage = UIScrollView!()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
  
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    
    @IBAction  func addUserImagePicker(sender: UIButton) {
        self.presentAlert("Add a Photo", message: "Pick an Option", withCancelButton: true, withThirdButton: true, defaultButtonTitle: "Add Photo from Image Library", thirdButtonTitle: "Take Picture",cancelButtonTitle: "Cancel", cancelClosure: nil, defaultClosure: { _ in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true,completion: nil)
            }, thirdClosure: { _ in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .Camera
                
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        })
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



//   // @IBAction func unwindToVC(segue:UIStoryboardSegue) {
//        if(segue.sourceViewController .isKindOfClass(FrancoCollectionCollectionViewController))
//        {
//            let francoCollectionView:FrancoCollectionCollectionViewController = segue.sourceViewController as! FrancoCollectionCollectionViewController
//            let selectedImageFromLibrary = selectedFranco
//            dragImage!.image = UIImage(named: selectedImageFromLibrary)
//        }
//
//    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }





    
    


