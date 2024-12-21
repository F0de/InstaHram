//
//  SignInInteractor.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit
import FirebaseAuth

protocol SignInInteractorInput: AnyObject {
    func authenticate(with request: SignInRequest) async
}

protocol SignInInteractorOutput: AnyObject {
    func presentSomething(response: SignInResponse)
}

class SignInInteractor: SignInInteractorInput, SignInViewControllerOutput {
    var output: SignInInteractorOutput?
    var worker: AuthWorker?
    
    // MARK: Business logic
    func authenticate(with request: SignInRequest) async {
        worker = AuthWorker.shared
        
        switch request.type {
            case .email(let email, let password):
                do {
                    guard let worker = worker else { return }
                    
                    let (email, username) = try await worker.signIn(with: email, password: password)
                    //TODO: Make response with user email and name
                } catch let error as NSError {
                    //TODO: Show alert on screen with error description
                    let errorDescription = handleAuthError(error)
                    print(errorDescription)
                }
            case .facebook(let accessToken):
                break
        }
        
        
        // NOTE: Pass the result to the Presenter
        let response = SignInResponse(success: false, userID: nil, error: .unknownError)
        output?.presentSomething(response: response)
    }
    
    private func handleAuthError(_ error: NSError) -> (Bool, FirebaseError) {
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
