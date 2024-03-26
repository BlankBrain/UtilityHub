//
//  Encodable.swift
//
//
//  Created by Ashik on 17-09-2023.
//  Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    var data: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var queryItems: [URLQueryItem]? {
        return self.dictionary?.compactMap { key, value in
            return URLQueryItem(name: key, value: "\(value)")
        }
    }
    
    var jsonString: String {
        guard let data = self.data else { return "" }
        return String(decoding: data, as: UTF8.self)
    }
    
    var prettyPrintedJSON: NSString? {
        guard let data = self.data,
              let object = try? JSONSerialization.jsonObject(with: data, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]) else { return nil }
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    }
}
