// 
// Beeda Seller
//
// Created by Rakibur Khan on 19/4/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit

public extension UIFont {
    enum PoppinsFont {
        case black
        case blackItalic
        case bold
        case boldItalic
        case extrabold
        case extraboldItalic
        case extraLight
        case extraLightItalic
        case italic
        case light
        case lightItalic
        case medium
        case mediumItalic
        case regular
        case semibold
        case semiboldItalic
        case thin
        case thinItalic
        
        var name: String {
            var font: String = ""
            
            switch self {
                case .black:
                    font = "Poppins-Black"
                case .blackItalic:
                    font = "Poppins-BlackItalic"
                case .bold:
                    font = "Poppins-Bold"
                case .boldItalic:
                    font = "Poppins-BoldItalic"
                case .extrabold:
                    font = "Poppins-ExtraBold"
                case .extraboldItalic:
                    font = "Poppins-ExtraBoldItalic"
                case .extraLight:
                    font = "Poppins-ExtraLight"
                case .extraLightItalic:
                    font = "Poppins-ExtraLightItalic"
                case .italic:
                    font = "Poppins-Italic"
                case .light:
                    font = "Poppins-Light"
                case .lightItalic:
                    font = "Poppins-LightItalic"
                case .medium:
                    font = "Poppins-Medium"
                case .mediumItalic:
                    font = "Poppins-MediumItalic"
                case .regular:
                    font = "Poppins-Regular"
                case .semibold:
                    font = "Poppins-SemiBold"
                case .semiboldItalic:
                    font = "Poppins-SemiBoldItalic"
                case .thin:
                    font = "Poppins-Thin"
                case .thinItalic:
                    font = "Poppins-ThinItalic"
            }
            
            return font
        }
    }
    
    final class func poppins(forTextStyle textStyle: UIFont.TextStyle, type: PoppinsFont, fontSize: CGFloat) -> UIFont {
        guard
            let font = UIFont(name: type.name, size: fontSize)
        else {
            return UIFont.preferredFont(forTextStyle: textStyle)
        }
        
        let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
        return fontMetrics.scaledFont(for: font)
    }
    
    final class func poppins(type: PoppinsFont, fontSize: CGFloat) -> UIFont? {
        UIFont(name: type.name, size: fontSize)
    }
}
