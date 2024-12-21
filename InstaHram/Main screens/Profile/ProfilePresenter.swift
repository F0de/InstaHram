//
//  ProfilePresenter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol ProfilePresenterInput: AnyObject {
    func presentSomething(response: ProfileResponse)
}

protocol ProfilePresenterOutput: AnyObject {
    func displaySomething(viewModel: ProfileViewModel)
}

class ProfilePresenter: ProfilePresenterInput {
    weak var output: ProfilePresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(response: ProfileResponse) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ProfileViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
