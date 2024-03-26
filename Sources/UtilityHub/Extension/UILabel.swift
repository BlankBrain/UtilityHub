// 
// Beeda Driver
//
// Created by Rakibur Khan on 9/2/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit

extension UILabel {
    func countLines(width: CGFloat) -> Int {
        guard let myText = self.text as NSString? else {
            return 0
        }
        // Call self.layoutIfNeeded() if your view uses auto layout
        let rect = CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font as Any], context: nil)
        return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }
}
