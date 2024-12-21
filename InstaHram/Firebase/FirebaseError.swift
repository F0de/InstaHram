//
//  FirebaseError.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.11.2024.
//

import Foundation

enum FirebaseError: Error {
    case networkError
    case permissionDenied
    case invalidToken
    case serverError
    case unknownError
    
    // Auth specific errors
    case invalidEmail
    case emailAlreadyInUse
    case operationNotAllowed
    case weakPassword
    case userDisabled
    case wrongPassword
    
    // Database specific errors
    case usernameAlreadyExists
    
    var description: String {
        switch self {
            case .networkError:
                return "No internet connection or network timeout"
            case .permissionDenied:
                return "Permission denied. Check Firebase Rules"
            case .invalidToken:
                return "Invalid authentication token"
            case .serverError:
                return "Firebase server error"
            case .unknownError:
                return "Unknown error occurred"
            case .invalidEmail:
                return "The email address is badly formatted"
            case .emailAlreadyInUse:
                return "The email address is already in use by another account"
            case .operationNotAllowed:
                return "Email/password sign up is not enabled"
            case .weakPassword:
                return "The password must be at least 6 characters long"
            case .userDisabled:
                return "The account is disabled"
            case .wrongPassword:
                return "The password is wrong"
            case .usernameAlreadyExists:
                return "This username is already taken. Please choose another one."
        }
    }
}
