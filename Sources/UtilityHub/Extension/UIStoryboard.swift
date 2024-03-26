//
//  UIStoryboard.swift
//  Beeda Driver
//
//  Created by Ashikul Hosen on 11/15/22.
//  Copyright © 2022 Beeda Inc. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    /// Returns the view controller object you defined as type, you need to set the storyboard ID same as class name.
    /// Also you must assign a type to the variable where you store the returned object
    ///  Example: let controller: TestViewController = self.storyboard.instantiate()
    /// - Returns:The UIViewController type that was set while initializing the variable
    func instantiate<T: UIViewController>() -> T? {
        let identifier = String(describing: T.self)
        return self.instantiateViewController(withIdentifier: identifier) as? T
    }
}
