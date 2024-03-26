// 
// 
//
// Created by Rakibur Khan on 25/6/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit
import UniformTypeIdentifiers

public struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    
    @available (iOS 14.0, *)
    public init?(withImage image: UIImage?, forKey key: String, fileName: String, type: UTType = .png) {
        self.key = key
        self.mimeType = type.preferredMIMEType ?? ""
        self.filename = fileName+".\(type.preferredFilenameExtension ?? "")"
        
        switch type {
            case .jpeg:
                guard let data = image?.jpegData(compressionQuality: 0.8) else { return nil }
                self.data = data
                
            case .png:
                guard let data = image?.pngData() else { return nil }
                self.data = data
                
            default:
                return nil
        }
    }
    
    public init?(withImage image: UIImage?, forKey key: String, fileName: String, mimeType: String) {
        self.key = key
        self.mimeType = mimeType
        self.filename = fileName
        guard let data = image?.pngData() else { return nil }
        self.data = data
    }
    
    public init?(data: Data?, forKey key: String, json: Bool) {
        self.key = key
        self.mimeType = json ? "application/x-www-form-urlencoded" : ""
        self.filename = ""
        guard let data = data else { return nil }
        self.data = data
    }
}
