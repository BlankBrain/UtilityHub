// 
// 
//
// Created by Rakibur Khan on 15/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit

public extension UIViewController {
    /// UIViewController classname and xib name must be same
    convenience init(bundle: Bundle? = nil) {
        let type = type(of: self)
        let nibName = String(describing: type)
        
        self.init(nibName: nibName, bundle: bundle)
    }
}
