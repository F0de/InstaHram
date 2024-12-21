//
//  ServerTimestamp.swift
//  InstaHram
//
//  Created by Влад Тимчук on 12.11.2024.
//

import Foundation

enum ServerTimestamp: Codable {
    case timestamp
    case value(Int64)
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case .timestamp:
                let kFirebaseServerValueTimestamp = [".sv": "timestamp"] as [String: String]
                try container.encode(kFirebaseServerValueTimestamp)
            case .value(let value):
                try container.encode(value)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let timestamp = try? container.decode(Int64.self) {
            self = .value(timestamp)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unable to decode timestamp")
        }
    }
}
