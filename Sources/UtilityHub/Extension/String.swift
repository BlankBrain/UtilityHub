// 
// Beeda Driver
//
// Created by Rakibur Khan on 9/1/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit

public extension String {
    var iso8601Date: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withTimeZone]
        
        return formatter.date(from: self)
    }
    
    func toDate(timeZone: TimeZone? = TimeZone.current, locale: Locale = Locale(identifier: "en_US_POSIX"), format: String = DateFormatter.Custom.apiString.rawValue) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = locale
        formatter.timeZone = timeZone
        
        return formatter.date(from: self)
    }
}

//MARK: Add *** inside card number
public extension String {
    func masked(matching regexPattern: String, with template: String = "*") throws -> String {
        let regex = try NSRegularExpression(pattern: regexPattern, options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, count)
        
        return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: template)
    }
    
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
        
        guard let characterSpacing = characterSpacing else {return attributedString}
        
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        
        return attributedString
    }
}

//Below Section Added by MD Jahirul Islam
public extension String {
    func trim() -> String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
        else { return nil }
        return from ..< to
    }
    
    func toDictionary() async -> [String:Any]? {
        guard let jsonData = self.data(using: .utf8) else {return nil}
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any] {
                return jsonObject
            }
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
        return nil
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

public extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

public extension String {
    mutating func replaceOccurrences<Target: StringProtocol, Replacement: StringProtocol>(of target: Target, with replacement: Replacement, options: String.CompareOptions = [], locale: Locale? = nil) {
        var range: Range<Index>?
        repeat {
            range = self.range(of: target, options: options, range: range.map { self.index($0.lowerBound, offsetBy: replacement.count)..<self.endIndex }, locale: locale)
            if let range = range {
                self.replaceSubrange(range, with: replacement)
            }
        } while range != nil
    }
    
    func estimatedFrameForText(font: UIFont, size: CGSize = .init(width: 250, height: 1000)) -> CGRect {
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: font], context: nil)
    }
    
    func getDimensionInFixedWidth(width: CGFloat, font: UIFont) -> CGRect {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox
    }
}

// From http://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
private let characterEntities : [ Substring : Character ] = [
    // XML predefined entities:
    "&quot;"    : "\"",
    "&amp;"     : "&",
    "&apos;"    : "'",
    "&lt;"      : "<",
    "&gt;"      : ">",
    
    // HTML character entity references:
    "&nbsp;"    : "\u{00a0}",
    // ...
    "&diams;"   : "♦",
]

public extension String {
    /// Returns a new string made by replacing in the `String`
    /// all HTML character entity references with the corresponding
    /// character.
    var stringByDecodingHTMLEntities : String {
        
        // ===== Utility functions =====
        
        // Convert the number in the string to the corresponding
        // Unicode character, e.g.
        //    decodeNumeric("64", 10)   --> "@"
        //    decodeNumeric("20ac", 16) --> "€"
        func decodeNumeric(_ string : Substring, base : Int) -> Character? {
            guard let code = UInt32(string, radix: base),
                  let uniScalar = UnicodeScalar(code) else { return nil }
            return Character(uniScalar)
        }
        
        // Decode the HTML character entity to the corresponding
        // Unicode character, return `nil` for invalid input.
        //     decode("&#64;")    --> "@"
        //     decode("&#x20ac;") --> "€"
        //     decode("&lt;")     --> "<"
        //     decode("&foo;")    --> nil
        func decode(_ entity : Substring) -> Character? {
            
            if entity.hasPrefix("&#x") || entity.hasPrefix("&#X") {
                return decodeNumeric(entity.dropFirst(3).dropLast(), base: 16)
            } else if entity.hasPrefix("&#") {
                return decodeNumeric(entity.dropFirst(2).dropLast(), base: 10)
            } else {
                return characterEntities[entity]
            }
        }
        
        // ===== Method starts here =====
        
        var result = ""
        var position = startIndex
        
        // Find the next '&' and copy the characters preceding it to `result`:
        while let ampRange = self[position...].range(of: "&") {
            result.append(contentsOf: self[position ..< ampRange.lowerBound])
            position = ampRange.lowerBound
            
            // Find the next ';' and copy everything from '&' to ';' into `entity`
            guard let semiRange = self[position...].range(of: ";") else {
                // No matching ';'.
                break
            }
            let entity = self[position ..< semiRange.upperBound]
            position = semiRange.upperBound
            
            if let decoded = decode(entity) {
                // Replace by decoded character:
                result.append(decoded)
            } else {
                // Invalid entity, copy verbatim:
                result.append(contentsOf: entity)
            }
        }
        // Copy remaining characters to `result`:
        result.append(contentsOf: self[position...])
        return result
    }
}

public extension String {
    /// Apply strike font on text
    func strikeThrough(color:UIColor = UIColor.systemGreen) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 2,
            range: NSRange(location: 0, length: attributeString.length))
        attributeString.addAttribute(NSAttributedString.Key.strikethroughColor, value: color, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
    
    var notificationName: Notification.Name {
        return Notification.Name(self)
    }
}

public extension String {
    func size(font: UIFont, width: CGFloat) -> CGSize {
        let attrString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font])
        let bounds = attrString.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        let size = CGSize(width: bounds.width, height: bounds.height)
        return size
    }
}

public extension String{
    func verifyUrl () -> Bool {
        if let url = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        }
        
        return false
    }
    
    func getFileType() -> String {
        let lowerCasePath = self.lowercased()
        
        if lowerCasePath == "png".lowercased() {
            return FileType.image.rawValue
        } else if lowerCasePath == "JPEG".lowercased(){
            return FileType.image.rawValue
        } else if lowerCasePath == "JPG".lowercased(){
            return FileType.image.rawValue
        } else if lowerCasePath == "GIF".lowercased(){
            return FileType.image.rawValue
        } else if lowerCasePath == "TIFF".lowercased(){
            return FileType.image.rawValue
        } else if lowerCasePath == "PSD".lowercased(){
            return FileType.image.rawValue
        }
        
        //Video Format
        else if lowerCasePath == "MP4".lowercased(){
            return FileType.video.rawValue
        } else if lowerCasePath == "MOV".lowercased(){
            return FileType.video.rawValue
        } else if lowerCasePath == "MPEG".lowercased(){
            return FileType.video.rawValue
        } else if lowerCasePath == "WMV".lowercased(){
            return FileType.video.rawValue
        } else if lowerCasePath == "AVI".lowercased(){
            return FileType.video.rawValue
        } else if lowerCasePath == "AVCHD".lowercased(){
            return FileType.video.rawValue
        } else if lowerCasePath == "3GP".lowercased(){
            return FileType.video.rawValue
        }
        
        return FileType.chat.rawValue
    }
}

enum FileType: String{
    case chat = "chat"
    case image = "img"
    case video = "video"
    case file = "file"
}
