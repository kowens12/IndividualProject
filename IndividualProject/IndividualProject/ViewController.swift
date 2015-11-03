//
//  ViewController.swift
//  IndividualProject
//
//  Created by Kate Owens  on 11/2/15.
//  Copyright © 2015 Me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var dragImage: UIImageView!
    let draggableImage = UIPanGestureRecognizer()

    @IBOutlet weak var userImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draggableImage.addTarget(self, action: "draggedView:")
        dragImage.addGestureRecognizer(draggableImage)
        dragImage.userInteractionEnabled = true
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

    
    @IBAction func addUserImagePicker(sender: UIButton) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
      

        presentViewController(imagePicker, animated: true, completion: nil)
//        print("working")
    }
    
    @IBAction func takeNewPhoto(sender: AnyObject) {
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("working")
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("working")
            userImageView.contentMode = .ScaleAspectFit
            userImageView.image = pickedImage
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
