// 
// Beeda Driver
//
// Created by Rakibur Khan on 9/11/22.
// Copyright © 2022 Beeda Inc. All rights reserved.
//

import UIKit
import Combine

fileprivate var secureTextState: Bool?
fileprivate var systemTint: UIColor?

public extension UITextField {
    func setSecureTextToggle(viewMode: ViewMode = .always, color: UIColor, toggleSide: ToggleEdge, padding: CGFloat = 14) {
        let size = self.frame.height
        
        self.isSecureTextEntry = true
        let secureText = self.isSecureTextEntry
        secureTextState = secureText
        systemTint = color
        
        //Adding Button Properties
        let iconButton = UIButton(frame: CGRect(x: 0, y: 0, width: size, height: size))
        iconButton.setImage(UIImage(named: "password_eye", in: .module, compatibleWith: nil), for: .normal)
        iconButton.tintColor = .systemGray
        
        //Adding Button action listener
        iconButton.addTarget(self, action: #selector(toggleButtonControl), for: .touchUpInside)
        
        //Adding button into a container view
        let iconContainerView: UIView = UIView()
        iconContainerView.addSubview(iconButton)
        
        switch toggleSide {
            case .leading:
                iconButton.anchor(top: iconContainerView.safeAreaLayoutGuide.topAnchor, leading: iconContainerView.safeAreaLayoutGuide.leadingAnchor, bottom: iconContainerView.safeAreaLayoutGuide.bottomAnchor, trailing: iconContainerView.safeAreaLayoutGuide.trailingAnchor, paddingLeading: padding, paddingTrailing: padding)
                
                //Adding container to textfield
                leftView = iconContainerView
                leftViewMode = viewMode
                
            case .trailing:
                iconButton.anchor(top: iconContainerView.safeAreaLayoutGuide.topAnchor, leading: iconContainerView.safeAreaLayoutGuide.leadingAnchor, bottom: iconContainerView.safeAreaLayoutGuide.bottomAnchor, trailing: iconContainerView.safeAreaLayoutGuide.trailingAnchor, paddingLeading: padding, paddingTrailing: padding)
                
                //Adding container to textfield
                rightView = iconContainerView
                rightViewMode = viewMode
        }
    }
    
    //MARK: Method to toggle Secure Text
    @objc func toggleButtonControl(_ sender: UIButton){
        guard var textSecured = secureTextState else {return}
        let tint = systemTint
        
        if textSecured {
            self.isSecureTextEntry = false
            textSecured = self.isSecureTextEntry
            secureTextState = textSecured
            sender.setImage(UIImage(named: "password_eye", in: .module, compatibleWith: nil), for: .normal)
            sender.tintColor = tint
            
        } else {
            self.isSecureTextEntry = true
            textSecured = self.isSecureTextEntry
            secureTextState = textSecured
            sender.setImage(UIImage(named: "password_eye", in: .module, compatibleWith: nil), for: .normal)
            sender.tintColor = .systemGray
            
        }
    }
    
    func textPublisher() -> AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { ($0.object as? UITextField)?.text  ?? "" }
            .eraseToAnyPublisher()
    }
    
    enum ToggleEdge {
        case leading
        case trailing
    }
    
    //MARK: To set image in right corner of textfield
    func setSecureTextToggleToRight(_ color: UIColor, paddingRight: CGFloat = 14) {
        setSecureTextToggle(color: color, toggleSide: .trailing, padding: paddingRight)
    }
}

//MARK- TextField Padding
public extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 34))
        keyboardToolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self, action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = keyboardToolbar
    }
}
