// 
// Beeda Driver
//
// Created by Rakibur Khan on 30/10/22.
// Copyright © 2022 Beeda Inc. All rights reserved.
//

import Foundation

public extension DateFormatter {
    enum Custom: String {
        case apiString = "yyyy-MM-dd HH:mm:ss"
        case iso8601APIFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        case uiFormatted12HFormat = "MMMddyyyyhhmma"
    }
}
