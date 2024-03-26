// 
// 
//
// Created by Rakibur Khan on 16/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit

public extension CGRect {
    var minEdge: CGFloat {
        return min(width, height)
    }
}
