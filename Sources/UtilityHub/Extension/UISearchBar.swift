// 
// 
//
// Created by Rakibur Khan on 29/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit

public extension UISearchBar {
    func customizedSearchBar(){
        self.backgroundImage = UIImage()
        self.searchTextField.backgroundColor = .clear
        self.searchTextField.leftViewMode = .never
        self.searchTextField.rightViewMode = .never
        self.searchTextField.fillSuperview(padding: UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0))
        self.setPositionAdjustment(UIOffset(horizontal: -20, vertical: 0), for: .search)
    }
}
