// 
// 
//
// Created by Rakibur Khan on 16/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation
import UIKit

public class RM {
    //Updated 
    public static let shared = RM()
    
    var bounds: CGRect = UIScreen.main.bounds
    let baseWidth: CGFloat =  375//414
    let baseHeight: CGFloat = 812//896
    
    let iphone10Width: CGFloat = 375
    let iphone10Height: CGFloat = 812
    
    func getDeviceWidth() -> CGFloat{
        bounds.size.width
    }
    
    func getDeviceHeight() -> CGFloat{
        bounds.size.height
    }
    func getNewsImageWidth() -> CGFloat{
        bounds.size.width-30
    }
    
   public func width(_ value: CGFloat) -> CGFloat {
        switch UIDevice.modelName {
        case "iPhone 6", "iPhone 6s", "iPhone 7", "iPhone 8", "iPhone SE", "iPhone SE (2nd generation)", "iPhone SE (3rd generation)":
                
                let resoulationDiffernece = baseWidth/iphone10Width
                let actualWidth = CGFloat(value)/resoulationDiffernece
                
                return actualWidth
                
            case "iPhone 6s Plus", "iPhone 7 Plus", "iPhone 8 Plus":
                
                let resoulationDiffernece = baseWidth/baseWidth
                let actualWidth = CGFloat(value)/resoulationDiffernece
                
                return actualWidth
                
            default:
                
                let resoulationDiffernece = baseWidth/getDeviceWidth()
                let actualWidth = CGFloat(value)/resoulationDiffernece
                
                return actualWidth
        }
    }
    
   public func height(_ value: CGFloat) -> CGFloat {
        switch UIDevice.modelName {
        case "iPhone 6", "iPhone 6s", "iPhone 7", "iPhone 8", "iPhone SE", "iPhone SE (2nd generation)", "iPhone SE (3rd generation)":
                
                let resoulationDiffernece = baseHeight/iphone10Height
                let actualHeight = CGFloat(value)/resoulationDiffernece
                
                return actualHeight
                
            case "iPhone 6s Plus", "iPhone 7 Plus", "iPhone 8 Plus":
                
                let resoulationDiffernece = baseHeight/baseHeight
                let actualHeight = CGFloat(value)/resoulationDiffernece
                
                return actualHeight
                
            default:
                let resoulationDiffernece = baseHeight/getDeviceHeight()
                let actualHeight = CGFloat(value)/resoulationDiffernece
                
                return actualHeight
        }
    }
}
