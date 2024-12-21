//
//  AuthModels.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import Foundation

struct SignInRequest {
    enum SignInType {
        case email(email: String, password: String)
        case facebook(accessToken: String)
    }
    
    let type: SignInType
}

struct SignInResponse {
    let success: Bool
    let userID: String?
    let error: FirebaseError?
}

struct SignInViewModel {
}
