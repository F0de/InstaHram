//
//  SignInPresenter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol SignInPresenterInput: AnyObject {
    func presentSomething(response: SignInResponse)
}

protocol SignInPresenterOutput: AnyObject {
    func displaySomething(viewModel: SignInViewModel)
}

class SignInPresenter: SignInPresenterInput {
    weak var output: SignInPresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(response: SignInResponse) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = SignInViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
