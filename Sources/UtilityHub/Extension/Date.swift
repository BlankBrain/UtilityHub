// 
// Beeda Driver
//
// Created by Rakibur Khan on 30/10/22.
// Copyright © 2022 Beeda Inc. All rights reserved.
//

import Foundation

public extension Date {
    func convertDateTimeToHumanString(timeZone: TimeZone? = TimeZone.current, timeZoneForRemoteDate: TimeZone? = TimeZone(abbreviation: "GMT"), locale: Locale = Locale(identifier: "en_US_POSIX"), localizedDateFormatFromTemplate: String = DateFormatter.Custom.uiFormatted12HFormat.rawValue)-> String {
        
        let formatter = DateFormatter()
        
        formatter.timeZone = timeZone
        formatter.locale = locale
        formatter.setLocalizedDateFormatFromTemplate(localizedDateFormatFromTemplate)
        
        let read = formatter.string(from: self)
        
        return read
    }
    
    func convertDateToHumanString(timeZone: TimeZone? = TimeZone.current, timeZoneForRemoteDate: TimeZone? = TimeZone(abbreviation: "GMT"), locale: Locale = Locale(identifier: "en_US_POSIX"), localizedDateFormatFromTemplate: String = "MMMMddyyyy")-> String {
        
        let formatter = DateFormatter()
        
        formatter.timeZone = timeZone
        formatter.locale = locale
        formatter.setLocalizedDateFormatFromTemplate(localizedDateFormatFromTemplate)
        
        let read = formatter.string(from: self)
        
        return read
    }
    
    @inlinable func convertToJSONUploadStyle(format: String = "yyyy-MM-dd")-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        let date = dateFormatter.string(from: self)
        
        return date
    }
    
    func relativeDateTimeString(context: Formatter.Context = .listItem, style: RelativeDateTimeFormatter.DateTimeStyle = .numeric, unitStyle: RelativeDateTimeFormatter.UnitsStyle = .abbreviated, relativeDate: Date = Date()) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.formattingContext = context
        formatter.dateTimeStyle = style
        formatter.unitsStyle = unitStyle
        
        return formatter.localizedString(for: self, relativeTo: relativeDate)
    }
    
    func dateValue(_ from: Calendar.Identifier = .iso8601, of: Calendar.Component) -> Int {
        let calander = Calendar(identifier: from)
        
        let component = calander.component(of, from: self)
        
        return component
    }
}

public extension Date {
    func previousMonth(identifier: Calendar.Identifier = .iso8601)-> Date? {
        Calendar(identifier: identifier).date(byAdding: .month, value: -1, to: self)
    }
    
    func currentMonth(identifier: Calendar.Identifier = .iso8601)-> Date? {
        Calendar(identifier: identifier).date(byAdding: .month, value: 0, to: self)
    }
    
    func nextMonth(identifier: Calendar.Identifier = .iso8601)-> Date? {
        Calendar(identifier: identifier).date(byAdding: .month,  value: 1, to: self)
    }
    
    func dayNumber(identifier: Calendar.Identifier = .iso8601)-> Int {
        dateValue(identifier, of: .day)
    }
    
    func monthNumber(identifier: Calendar.Identifier = .iso8601)-> Int {
        dateValue(identifier, of: .month)
    }
    
    func yearNumber(identifier: Calendar.Identifier = .iso8601)-> Int {
        dateValue(identifier, of: .year)
    }
}
