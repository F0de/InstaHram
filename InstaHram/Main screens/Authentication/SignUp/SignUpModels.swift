//
//  SignInRequest.swift
//  InstaHram
//
//  Created by Влад Тимчук on 16.11.2024.
//


import Foundation

struct SignUpRequest {
    enum SignUpType {
        case email(username: String, email: String, password: String, repeatPassword: String)
        case facebook(accessToken: String)
    }
    
    let type: SignUpType
}

struct SignUpResponse {
    let success: Bool
    let userID: String?
    let error: FirebaseError?
}

struct SignUpViewModel {
}
