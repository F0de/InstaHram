//
//  AuthWorker.swift
//  InstaHram
//
//  Created by Влад Тимчук on 03.11.2024.
//

import Foundation
import FirebaseAuth
import FacebookLogin

/// Worker responsible for signing in, up and out
final class AuthWorker {
    /// Singleton instance of the AuthWorker
    static let shared = AuthWorker()
    
    /// Private constructor
    private init() {}
    
    /// Check if user signed in with Firebase
    private var isFirebaseSignedIn: Bool {
        Auth.auth().currentUser != nil
    }
    
    /// Check if user signed in with Facebook
    private var isFacebookSignedIn: Bool {
        AccessToken.current != nil && !AccessToken.current!.isExpired
    }
    
    /// Represents if user signed in
    public var isSignedIn: Bool {
        isFirebaseSignedIn || isFacebookSignedIn
    }
    
    /// Method to user sign in with email and password
    /// - Parameters:
    ///   - email: User email
    ///   - password: User password
    ///   - completion: Async results callback
    func signIn(with email: String, password: String) async throws -> (email: String, username: String?) {
        try await Auth.auth().signIn(withEmail: email, password: password)
        
        do {
            let username = try await DatabaseWorker.shared.getUsername(by: email)
            return (email, username)
        } catch let error as NSError {
            //TODO: Show alert on screen with error description
            let errorDescription = handleAuthError(error)
            print(errorDescription)
        }
        return (email, nil)
    }
    
    //TODO: SignIn method with facebook
    
    
    /// SignUp with email
    /// - Parameters:
    ///   - username: Desired username
    ///   - email: User email
    ///   - password: User password
    ///   - success: True if sign up was successful, false otherwise
    /// - Returns: Returns (true,nil) if
    func signUp(with username: String, email: String, password: String) async -> (Bool, FirebaseError?) {
        // Check if username is available in database
        let (exists, error) = await DatabaseWorker.shared.isUsernameExists(username)
        if let error = error {
            print(error.description)
            //TODO: Show alert on screen with error description
            return (false, error)
        } else if exists {
            return (false, .usernameAlreadyExists)
        } else {
            // Create new user
            do {
                try await Auth.auth().createUser(withEmail: email, password: password)
                
                // Insert new user in database
                let (sucess, error) = await DatabaseWorker.shared.insertUser(with: email, username: username)
                if let error = error {
                    print(error.description)
                    return (false, error)
                } else {
                    return (sucess, nil)
                }
            } catch let error as NSError {
                return handleAuthError(error)
            }
        }
    }
    
    //TODO: SignOut method with firebase
    
    //TODO: SignOut method with facebook
    
    private func handleAuthError(_ error: NSError) -> (Bool, FirebaseError) { // move to iteractor
        let firebaseError: FirebaseError

        if let errorCode = AuthErrorCode(rawValue: error.code) {
            switch errorCode {
                case .invalidEmail:
                    firebaseError = .invalidEmail
                case .emailAlreadyInUse:
                    firebaseError = .emailAlreadyInUse
                case .operationNotAllowed:
                    firebaseError = .operationNotAllowed
                case .weakPassword:
                    firebaseError = .weakPassword
                case .userDisabled:
                    firebaseError = .userDisabled
                case .wrongPassword:
                    firebaseError = .wrongPassword
                default:
                    firebaseError = .unknownError
            }
            
            return (false, firebaseError)
        }
        return (false, .unknownError)
    }
    
}
