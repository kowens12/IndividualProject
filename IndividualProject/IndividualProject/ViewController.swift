//
//  ViewController.swift
//  IndividualProject
//
//  Created by Kate Owens  on 11/2/15.
//  Copyright © 2015 Me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dragImage: UIImageView!
    let draggableImage = UIPanGestureRecognizer()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        draggableImage.addTarget(self, action: "draggedView:")
        dragImage.addGestureRecognizer(draggableImage)
        dragImage.userInteractionEnabled = true


         // Do any additional setup after loading the view, typically from a nib.
        
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
}
