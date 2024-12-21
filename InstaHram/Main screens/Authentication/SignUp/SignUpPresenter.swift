//
//  SignInPresenterInput.swift
//  InstaHram
//
//  Created by Влад Тимчук on 16.11.2024.
//


import UIKit

protocol SignUpPresenterInput: AnyObject {
    func presentSomething(response: SignUpResponse)
}

protocol SignUpPresenterOutput: AnyObject {
    func displaySomething(viewModel: SignUpViewModel)
}

class SignUpPresenter: SignUpPresenterInput {
    weak var output: SignUpPresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(response: SignUpResponse) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SignUpViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
