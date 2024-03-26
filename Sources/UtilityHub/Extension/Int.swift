// 
// 
//
// Created by Rakibur Khan on 18/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

public extension Int {
    private func numberFormatter() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        
        return formatter
    }
    
    func toLocal() -> String {
        let formatter = numberFormatter()
        formatter.numberStyle = .decimal
        
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? "\(self)"
    }
    
    func toPositiveSuffix(interval: Int, groupSeparator: Bool = false) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = groupSeparator
        
        if let selfNumber = Double(exactly: self), let divisor = Double(exactly: interval) {
            if selfNumber >= abs(divisor) {
                let remainder = selfNumber.truncatingRemainder(dividingBy: divisor)
                let formattedNumber = selfNumber - remainder
                
                if remainder > 0 {
                    formatter.positiveSuffix = "+"
                }
                
                return formatter.string(from: NSNumber(value: formattedNumber)) ?? ""
            }
        }
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    func toString() -> String {
        return String(self)
    }
}




