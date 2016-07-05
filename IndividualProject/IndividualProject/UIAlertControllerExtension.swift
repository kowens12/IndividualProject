//
//  UIAlertControllerExtension.swift
//  IndividualProject
//
//  Created by Katherine Owens on 7/1/16.
//  Copyright © 2016 Me. All rights reserved.
//

import Foundation

extension UIAlertController {
    static func createAlert(title: String,
                            message: String? = nil,
                            withCancelButton: Bool = false,
                            withThirdButton: Bool = false,
                            defaultButtonTitle: String = NSLocalizedString("OK", comment: "OK"),
                            thirdButtonTitle: String = NSLocalizedString("OK", comment: "OK"),
                            cancelButtonTitle: String = NSLocalizedString("Cancel", comment: "Cancel"),
                            cancelClosure: (() -> Void)? = nil,
                            thirdClosure: (() -> Void)? = nil,
                            defaultClosure: (() -> Void)? = nil) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: defaultButtonTitle, style: .Default) { _ in
            defaultClosure?()
        }
        controller.addAction(defaultAction)
        
        if withCancelButton {
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { _ in
                cancelClosure?()
        }
        controller.addAction(cancelAction)
        }
        
        if withThirdButton {
            let thirdAction = UIAlertAction(title: thirdButtonTitle, style: .Default) { _ in
                thirdClosure?()
        }
        controller.addAction(thirdAction)
        }
        return controller
    }
    
    func createSingleButtonAlert(title: String, message: String, buttonTitle: String, buttonClosure: (() -> Void)? = nil) ->
        UIAlertController {
            return createAlert(title, message: message, defaultButtonTitle: buttonTitle, defaultClosure: buttonClosure)
    }
}