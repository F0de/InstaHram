//
//  StoriesModel.swift
//  InstaHram
//
//  Created by Влад Тимчук on 11.11.2024.
//

import Foundation

struct StoriesModel: Codable {
    var id: Int
    var createdAt: ServerTimestamp
    
    var content: String // path to file in storage
}

extension StoriesModel {
    var createdAtValue: Int64? {
        if case .value(let timestamp) = createdAt {
            return timestamp
        }
        return nil
    }
    
    var createdAtDate: Date? {
        guard let timestamp = createdAtValue else { return nil }
        return Date(timeIntervalSince1970: TimeInterval(timestamp / 1000))
    }
}
