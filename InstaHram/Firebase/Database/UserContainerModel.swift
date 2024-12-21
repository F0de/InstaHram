//
//  UserContainerModel.swift
//  InstaHram
//
//  Created by Влад Тимчук on 11.11.2024.
//

import Foundation

struct UsersContainerModel: Codable {
    var users: [String: UserModel] // username: UserModel
}
