//
//  SignUpInteractor.swift
//  InstaHram
//
//  Created by Влад Тимчук on 16.11.2024.
//

import UIKit
import FirebaseAuth

protocol SignUpInteractorInput: AnyObject {
    func authenticate(with request: SignUpRequest) async
}

protocol SignUpInteractorOutput: AnyObject {
    func presentSomething(response: SignUpResponse)
}

class SignUpInteractor: SignUpInteractorInput, SignUpViewControllerOutput {
    var output: SignUpInteractorOutput?
    var worker: AuthWorker?
    
    // MARK: Business logic
    func authenticate(with request: SignUpRequest) async {
        worker = AuthWorker.shared
        
        switch request.type {
            case .email(let username, let email, let password, let repeatPassword):
                if password == repeatPassword {
                    guard let worker = worker else { return }
                    
                    let (success, error) = await worker.signUp(with: username, email: email, password: password)
                    if error != nil {
                        //TODO: Make response with user email and name
                    } else if let error = error {
                        //TODO: Show alert on screen with error description
                        print(error.description)
                    }
                } else {
                    // TODO: present passwords error through SignInPresenter
                }
                break
            case .facebook(let accessToken):
                break
                
        }
        
        
        // NOTE: Pass the result to the Presenter
        let response = SignUpResponse(success: false, userID: nil, error: .unknownError)
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
