// 
// Beeda Seller
//
// Created by Rakibur Khan on 19/4/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

public extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    var releaseVersionNumberPretty: String {
        return "v\(releaseVersionNumber ?? "1.0.0")"
    }
    
    var bundleDisplayName: String {
        return infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }
}
