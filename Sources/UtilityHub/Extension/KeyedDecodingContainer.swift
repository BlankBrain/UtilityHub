//
//  KeyedDecodingContainer.swift
//
//
//  Created by Ashik on 17-09-2023.
//  Copyright © 2023 Beeda Inc. All rights reserved.
//

import Foundation

public extension KeyedDecodingContainer {
    
    func decodeIntIfPresent(forKey key: KeyedDecodingContainer<K>.Key) throws -> Int? {
        if let stringValue = try? decode(String.self, forKey: key) {
            return Int(stringValue)
        } else if let doubleValue = try? decode(Double.self, forKey: key) {
            return Int(doubleValue)
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return intValue
        }
        return nil
    }
    
    func decodeStringIfPresent(forKey key: KeyedDecodingContainer<K>.Key) throws -> String? {
        if let stringValue = try? decode(String.self, forKey: key) {
            return stringValue
        } else if let doubleValue = try? decode(Double.self, forKey: key) {
            return String(doubleValue)
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return String(intValue)
        }
        return nil
    }
    
    func decodeDoubleIfPresent(forKey key: KeyedDecodingContainer<K>.Key) throws -> Double? {
        if let stringValue = try? decode(String.self, forKey: key) {
            return Double(stringValue)
        } else if let doubleValue = try? decode(Double.self, forKey: key) {
            return doubleValue
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return Double(intValue)
        }
        return nil
    }
    
    func decodeIntFromBoolIfPresent(forKey key: KeyedDecodingContainer<K>.Key) throws -> Int? {
        if let boolValue = try? decode(Bool.self, forKey: key) {
            return boolValue ? 1 : 0
        } else if let intValue = try? decode(Int.self, forKey: key) {
            return intValue
        }
        return nil
    }
}
