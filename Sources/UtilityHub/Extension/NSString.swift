// 
// 
//
// Created by Rakibur Khan on 16/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

// validator
public extension NSString {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
