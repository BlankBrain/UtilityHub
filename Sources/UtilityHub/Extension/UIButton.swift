//
//  UIButton.swift
//  Beeda Driver
//
//  Created by Rakibur Khan on 20/11/22.
//  Copyright © 2022 Beeda Inc. All rights reserved.
//

import UIKit

public extension UIButton {
    func customizeButton(title: String, font: UIFont? = nil, textColor: UIColor?, icon: UIImage? = nil, backgroundColor color: UIColor?, cornerRadius: CGFloat? = nil, edgeInsets: NSDirectionalEdgeInsets? = nil) {
        self.customizeButtonBase(title: title, font: font, textColor: textColor, icon: icon, backgroundColor: color, cornerRadius: cornerRadius, edgeInsets: edgeInsets)
    }
    
    func customizeButton(icon: UIImage? , backgroundColor color: UIColor?, cornerRadius: CGFloat? = nil, edgeInsets: NSDirectionalEdgeInsets? = nil) {
        self.customizeButtonBase(icon: icon, backgroundColor: color, cornerRadius: cornerRadius, edgeInsets: edgeInsets)
    }
    
    fileprivate func customizeButtonBase(title: String? = nil, font: UIFont? = nil, textColor: UIColor? = nil, icon: UIImage? = nil, backgroundColor color: UIColor? = nil, cornerRadius: CGFloat? = nil, edgeInsets: NSDirectionalEdgeInsets? = nil, overrideConfiguration: Bool = false) {
        if let buttonTitle = title {
            setTitle(buttonTitle, for: .normal)
        }
        
        if #available(iOS 15, *), !overrideConfiguration {
            var configuration = UIButton.Configuration.filled()
            
            if let insets = edgeInsets {
                configuration.contentInsets = insets
            }
            
            if let color = color {
                configuration.baseBackgroundColor = color
            }
            
            configuration.image = icon
            configuration.imagePadding = 5
#if swift(>=5.8)
            configuration.titleLineBreakMode = .byWordWrapping
#endif
            configuration.cornerStyle = .small
            
            self.configuration = configuration
            
            configurationUpdateHandler = { button in
                button.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    if let buttonFont = font {
                        outgoing.font = buttonFont
                    }
                    
                    switch button.state {
                        case .disabled:
                            outgoing.foregroundColor = .secondaryLabel
                            button.backgroundColor = .systemGray
                            
                        default:
                            if let textColor = textColor {
                                outgoing.foregroundColor = textColor
                            }
                            
                            if let color = color {
                                button.backgroundColor = color
                            }
                    }
                    
                    return outgoing
                }
            }
        } else {
            if let insets = edgeInsets {
                contentEdgeInsets = .init(top: insets.top, left: insets.leading, bottom: insets.bottom, right: insets.trailing)
            }
            
            if let textColor = textColor {
                setTitleColor(textColor, for: .normal)
            }
            titleLabel?.lineBreakMode = .byWordWrapping
            titleLabel?.numberOfLines = 1
            setTitleColor(.secondaryLabel, for: .disabled)
            setImage(icon, for: .normal)
            imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 5)
            
            if let buttonFont = font {
                titleLabel?.font = buttonFont
            }
        }
        
        if let color = color {
            backgroundColor = color
        }
        
        if let cornerRadius = cornerRadius {
            roundedCorner(radius: cornerRadius)
        } else {
            roundedCorner(radius: 0)
        }
    }
}
