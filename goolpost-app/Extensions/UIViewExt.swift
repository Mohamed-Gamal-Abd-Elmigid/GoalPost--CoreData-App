//
//  UIViewExt.swift
//  goolpost-app
//
//  Created by mac on 4/7/20.
//  Copyright © 2020 ASD. All rights reserved.
//

import UIKit

extension UIView
{
    func bindToKeybord()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillCahnge(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keybordWillCahnge(_ notification : NSNotification)
    {
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let startingFram = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue ).cgRectValue
        let endingFram = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = endingFram.origin.y - startingFram.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: KeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
                                }
            , completion: nil)
    }
}
