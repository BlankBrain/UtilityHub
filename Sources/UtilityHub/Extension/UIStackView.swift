// 
// 
//
// Created by Rakibur Khan on 3/1/24.
// Copyright © 2024 Beeda Inc. All rights reserved.
//

import UIKit

extension UIStackView {
    func setSpacingBefore(_ spacing: CGFloat) {
        guard let firstView = arrangedSubviews.first else { return }
        
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        spacerView.widthAnchor.constraint(equalToConstant: spacing).isActive = true
        
        insertArrangedSubview(spacerView, at: 0)
        
        // Remove any existing constraints on the first arranged subview
        firstView.constraints.forEach { constraint in
            firstView.removeConstraint(constraint)
        }
        
        // Add a constraint between the spacer view and the first arranged subview
        spacerView.trailingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: -spacing).isActive = true
    }
}
