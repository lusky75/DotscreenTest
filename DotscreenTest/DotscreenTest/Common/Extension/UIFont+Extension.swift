//
//  UIFont.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import Foundation

import UIKit

extension UIFont {
    
    static let appFont = "AvenirNext-Regular"
    static let appFontBold = "AvenirNext-Bold"
    static let appFontItalic = "AvenirNext-It"
    static let appFontDemiBold = "AvenirNext-DemiBold"
    
    static func setAppFont(size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.appFont, size: size)!
    }
    
    static func setDemiBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.appFontDemiBold, size: size)!
    }
    
    static func setBoldAppFont(size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.appFontBold, size: size)!
    }
}
