 //
// Beeda Driver
//
// Created by Rakibur Khan on 9/1/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

public extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
