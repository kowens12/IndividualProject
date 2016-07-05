//
//  ViewControllerExtensions.swift
//  IndividualProject
//
//  Created by Katherine Owens on 7/1/16.
//  Copyright © 2016 Me. All rights reserved.
//

import Foundation

extension ViewController {
    func presentOKAlert(title: String, message: String) {
        presentAlert(title, message: message)
    }
    
    func presentSingleButtonAlert(title: String, message: String, buttonTitle: String, buttonClosure: (() -> Void)? = nil) {
        presentAlert(title, message: message, defaultButtonTitle: buttonTitle, defaultClosure: buttonClosure)
    }
    
    func presentAlert(title: String,
                      message: String? = nil,
                      withThirdButton: Bool = false,
                      withCancelButton: Bool = false,
                      defaultButtonTitle: String = NSLocalizedString("OK", comment: "OK"),
                      thirdButtonTitle: String = NSLocalizedString("OK", comment: "OK"),
                      cancelButtonTitle: String = NSLocalizedString("Cancel", comment: "Cancel"),
                      cancelClosure: (() -> Void)? = nil,
                      thirdClosure: (() -> Void)? = nil,
                      defaultClosure: (() -> Void)? = nil) {
        let controller = UIAlertController.createAlert(title, message: message, withThirdButton: withThirdButton, withCancelButton: withCancelButton,
                                                       defaultButtonTitle: defaultButtonTitle, thirdButtonTitle: thirdButtonTitle, cancelButtonTitle: cancelButtonTitle, thirdClosure: thirdClosure,
                                                       cancelClosure: cancelClosure,
                                                       defaultClosure: defaultClosure)
        
        presentViewController(controller, animated: true, completion: nil)
    }
}