//
//  UserModel.swift
//  InstaHram
//
//  Created by Влад Тимчук on 11.11.2024.
//

import Foundation

struct UserModel: Codable {
    var id: Int
    var name: String
    var email: String
    var createdAt: ServerTimestamp
    var authType: [String]
    
    var displayName: String?
    var description: String?
    
    var posts: [Int: PostModel] // postId: PostModel
    var stories: [Int: StoriesModel] // postId: StoriesModel
}
            
extension UserModel {
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
