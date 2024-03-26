// 
// 
//
// Created by Rakibur Khan on 25/6/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

public class FormDataHelper {
    static public func generateBoundary()-> String {
        "Boundary-\(UUID().uuidString)"
    }
    
    static public  func createDataBody(data: Data? = nil, withParameters params: [String: Any]?, media: [Media]?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        
        if let data = data {
            body = data
        }
        
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value)" + "\(lineBreak)")
            }
        }
        
        if let media = media {
            for photo in media {
                if photo.filename.isEmpty {
                    body.append("--\(boundary + lineBreak)")
                    body.append("Content-Disposition: form-data; name=\"\(photo.key)\"\(lineBreak)")
                    body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
                    body.append(photo.data)
                    body.append(lineBreak)
                } else {
                    body.append("--\(boundary + lineBreak)")
                    body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
                    body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
                    body.append(photo.data)
                    body.append(lineBreak)
                }
            }
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
}
