//
//  NewPostPresenter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol NewPostPresenterInput: AnyObject {
    func presentSomething(response: NewPostResponse)
}

protocol NewPostPresenterOutput: AnyObject {
    func displaySomething(viewModel: NewPostViewModel)
}

class NewPostPresenter: NewPostPresenterInput {
    weak var output: NewPostPresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(response: NewPostResponse) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = NewPostViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
