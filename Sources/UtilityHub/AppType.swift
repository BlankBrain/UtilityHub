// 
// 
//
// Created by Rakibur Khan on 24/7/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

public enum AppType {
    case user
    case driver
    case seller
    case provider
    
    var xAppName: String {
        switch self {
            case .user:
                return "customer"
            case .driver:
                return "driver"
            case .seller:
                return "seller"
            case .provider:
                return "provider"
        }
    }
}
