//
//  AppEvents.swift
//  PelicanDemo
//
//  Created by Robert Manson on 9/26/17.
//  Copyright © 2017 Clutter. All rights reserved.
//

import Foundation

protocol Event {
    var timeStamp: Date { get }
    var dictionary: [String: Any] { get }
}

final class AppEvents {
    class func logEvent(_ event: Event) {
        let dictionary = event.dictionary
        print("Logged Event: ", dictionary)
    }
}

struct LoginEvent: Event {
    let timeStamp = Date()
    let email: String

    var dictionary: [String : Any] {
        return [
            "time_stamp": timeStamp.iso8601StringWithMilliseconds,
            "email": email
        ]
    }
}

fileprivate extension Date {
    var iso8601StringWithMilliseconds: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: self)
    }
}
