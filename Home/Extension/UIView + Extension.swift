//
//  UIView + Extension.swift
//  Home
//
//  Created by Vaishnavi on 02/01/25.
//

import UIKit


class CustomUIView :UIView {
    
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var shadowColour: UIColor {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return UIColor.clear
        }
        set {
            layer.shadowColor = newValue.cgColor
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable public var clipToCircle: Bool {
        get {
            return layer.cornerRadius == min(frame.size.width, frame.size.height) / 2
        }
        set {
            if newValue {
                if self.frame.size.width > self.frame.size.height {
                    self.layer.cornerRadius = self.frame.size.height / 2
                } 
                else {
                    self.layer.cornerRadius = self.frame.size.width / 2
                }
                self.clipsToBounds = true
            } 
            else {
                self.layer.cornerRadius = 0
                self.clipsToBounds = false
            }
        }
    }
}
