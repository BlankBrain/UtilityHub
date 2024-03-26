//
//  ExtensionUISegmentedControl.swift
//  BeedaWallet
//
//  Created by Apple iMac on 4/9/22.
//

import UIKit

extension UISegmentedControl {
    public func defaultConfiguration(font: UIFont = .poppins(forTextStyle: .callout, type: .medium, fontSize: 14), color: UIColor? = .systemGray) {
        let defaultAttributes: [NSAttributedString.Key : Any] = [.font: font, .foregroundColor: color ?? .systemGray]
        
        setTitleTextAttributes(defaultAttributes, for: .normal)
    }
    
    public func selectedConfiguration(font: UIFont = .poppins(forTextStyle: .callout, type: .medium, fontSize: 14), color: UIColor? = .systemBackground) {
        let selectedAttributes: [NSAttributedString.Key : Any] = [ .font: font, .foregroundColor: color ?? .systemBackground]
        
        setTitleTextAttributes(selectedAttributes, for: .selected)
    }
}
