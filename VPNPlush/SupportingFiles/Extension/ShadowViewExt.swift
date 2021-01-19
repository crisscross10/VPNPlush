//
//  ShadowViewExt.swift
//  WeCompare
//
//  Created by Robo Warrier on 26/05/20.
//  Copyright © 2020 TotalToneUp Limited. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class DefaultShadowCardView: UIView {
    
    @IBInspectable var CornerRadius: CGFloat = 6
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 7
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.35
    @IBInspectable var shadowRadius: CGFloat = 14.0
    
    override func layoutSubviews() {
        layer.cornerRadius = CornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowPath = shadowPath.cgPath

    }
}


@IBDesignable
class RoundedBorderedCardView: UIView {
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var shadowRadius: CGFloat = 15.0
    
    @IBInspectable var BorderWidth: CGFloat = 1.0
    @IBInspectable var BorderColor: UIColor = UIColor.black
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        layer.borderWidth = BorderWidth
        layer.borderColor = BorderColor.cgColor
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.width / 2)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowPath = shadowPath.cgPath
    }
    
}

@IBDesignable
class shadowCardView: UIView {
    
    @IBInspectable var isShadow: Bool = false
    
    @IBInspectable var CornerRadius: CGFloat = 6
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 7
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.35
    @IBInspectable var shadowRadius: CGFloat = 14.0
    
    override func layoutSubviews() {
        layer.cornerRadius = CornerRadius
        
        if isShadow {
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.width / 2)
            
            layer.masksToBounds = false
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
            layer.shadowOpacity = shadowOpacity
            layer.shadowRadius = shadowRadius
            layer.shadowPath = shadowPath.cgPath
        }

    }
}


@IBDesignable
class borderedShadowCardView: UIView {
    
    @IBInspectable var CornerRadius: CGFloat = 6
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 7
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.35
    @IBInspectable var shadowRadius: CGFloat = 14.0
    
    @IBInspectable var BorderWidth: CGFloat = 1.0
    @IBInspectable var BorderColor: UIColor = UIColor.black

    override func layoutSubviews() {
        layer.cornerRadius = CornerRadius
        layer.borderWidth = BorderWidth
        layer.borderColor = BorderColor.cgColor

        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.width / 2)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowPath = shadowPath.cgPath
    }
}

@IBDesignable
class customCornerView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    
    @IBInspectable var cornerFlag: Int = 0
    
    override func layoutSubviews() {
        var path = UIBezierPath()
            
        switch cornerFlag {
        case 1:
            path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case 2:
            path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case 3:
            path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight,.bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case 4:
            path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case 5:
            path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        case 6:
            path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.bottomLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        default:
            path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        }
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer

    }
    
}


@IBDesignable
class Round_CornerView: UIView {
    
    @IBInspectable var BorderWidth: CGFloat = 1.0
    @IBInspectable var BorderColor: UIColor = UIColor.black

    override func layoutSubviews() {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: self.frame.width / 2, height: self.frame.width / 2))
            
        layer.borderWidth = BorderWidth
        layer.borderColor = BorderColor.cgColor

        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}


@IBDesignable
extension UIImageView
{
    @IBInspectable
    var tintColorIMG: UIColor
    {
        set
        {
            let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
            self.image = templateImage

            self.tintColor = newValue
        }
        get
        {
            return self.tintColor
        }
    }
}
