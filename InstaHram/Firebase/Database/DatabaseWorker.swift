//
//  DatabaseWorker.swift
//  InstaHram
//
//  Created by Влад Тимчук on 03.11.2024.
//

import Foundation
import FirebaseCore
import FirebaseDatabase

/// Worker to iteract with database
final class DatabaseWorker {
    /// Singleton instance
    static let shared = DatabaseWorker()
    
    /// Private constructor
    private init() {}
    
    /// Database reference
    private let database = Database.database().reference()
    
    /// Insert a new user into database
    /// - Parameters:
    ///   - email: User's email address
    ///   - username: Unique username for the user
    /// - Returns: Returns (true, nil) if user was successfully inserted and (false, FirebaseError) if some error happend
    /// - Note: This operation may take several seconds to complete
    /// - Warning: Username must be unique
    func insertUser(with email: String, username: String) async -> (Bool, FirebaseError?) {
        do {
            let snapshot = try await database.child("users").getData()
            
            let newUser = UserModel(
                id: geterateUserId(from: snapshot),
                name: username,
                email: email,
                createdAt: .timestamp,
                authType: ["email"],
                posts: [:],
                stories: [:]
            )
            
            if !snapshot.exists() || snapshot.childrenCount == 0 {
                // database clear - create new structure
                let usersContainer = UsersContainerModel(users: [username: newUser])
                
                do {
                    let jsonData = try JSONEncoder().encode(usersContainer)
                    let usersDict = try JSONSerialization.jsonObject(with: jsonData) as? [String: Any] ?? [:]
                    try await database.setValue(usersDict)
                    return (true, nil)
                } catch let error as NSError {
                    print("Error encoding usersContainer: \(error.localizedDescription)")
                    return handleError(error)
                }
            } else {
                // database not clear - add user
                do {
                    let jsonData = try JSONEncoder().encode(newUser)
                    let userDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] ?? [:]
                    try await database.child("users").child(username).setValue(userDict)
                    return (true, nil)
                } catch let error as NSError {
                    print("Error encoding newUser: \(error.localizedDescription)")
                    return handleError(error)
                }
            }
        } catch let error as NSError {
            print("Error fetching snapshot: \(error.localizedDescription)")
            return handleError(error)
        }
    }
    
    //TODO: Insert a new post
    
    //TODO: Insert a new story
    
    //TODO: Change user description
        
    /// Getting username by user email from database
    /// - Parameter email: User's email address
    /// - Returns: Returns username or throw error
    /// - Note: This operation may take several seconds to complete
    func getUsername(by email: String) async throws -> String? {
        let snapshot = try await database.child("emailToUsername").child(email).getData()
        
        guard let username = snapshot.value as? String else {
            return nil
        }
        
        return username
    }
        
    /// Check if username available
    /// - Parameter username: Username for the user being checked for existence
    /// - Returns: Returns (true, nil) if user exists, (false, nil) if user do not exists and (false, FirebaseError) if some error happend
    /// - Note: This operation may take several seconds to complete
    func isUsernameExists(_ username: String) async -> (Bool, FirebaseError?) {
        do {
            let snapshot = try await database.child("users").child(username).getData()
            return (snapshot.exists(), nil)
        } catch let error as NSError {
            print("Error fetching snapshot: \(error.localizedDescription)")
            return handleError(error)
        }
    }
    
    private func geterateUserId(from snapshot: DataSnapshot) -> Int {
        if !snapshot.exists() || snapshot.childrenCount == 0 {
            return 1
        }
        
        if let usersDict = snapshot.value as? [String: [String: Any]] {
            let ids = usersDict.compactMap { _, userData -> Int? in
                return userData["id"] as? Int
            }
            return ids.max() ?? 1
        }
        
        return 1
    }
    
    private func handleError(_ error: NSError) -> (Bool, FirebaseError) {
        let firebaseError: FirebaseError
        
        switch error.code {
            case NSURLErrorNotConnectedToInternet, NSURLErrorTimedOut, NSURLErrorNetworkConnectionLost:
                firebaseError = .networkError
            case NSURLErrorUserAuthenticationRequired, NSURLErrorUserCancelledAuthentication:
                firebaseError = .invalidToken
            case 1:
                firebaseError = .permissionDenied
            case 500...599:
                firebaseError = .serverError
            default:
                firebaseError = .unknownError
        }
        
        return (false, firebaseError)
    }
    
}
