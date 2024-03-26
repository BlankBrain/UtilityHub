//
//  PreviewContainer.swift
//
//
//  Created by Ashik on 17-09-2023.
//  Copyright © 2023 Beeda. All rights reserved.
//

import SwiftUI

public struct UIViewControllerContainer<T: UIViewController>: UIViewControllerRepresentable {

    let viewController: T

    public init(_ viewBuilder: @escaping () -> T) {
        viewController = viewBuilder()
    }
    
    public func makeUIViewController(context: Context) -> T {
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: T, context: Context) {}
}

public struct UIViewContainer<T: UIView>: UIViewRepresentable {

    let view: T

    public init(_ viewBuilder: @escaping () -> T) {
        self.view = viewBuilder()
    }
    
    public func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {}
}
