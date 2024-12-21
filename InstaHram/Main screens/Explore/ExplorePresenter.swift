//
//  ExplorePresenter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol ExplorePresenterInput: AnyObject {
    func presentSomething(response: ExploreResponse)
}

protocol ExplorePresenterOutput: AnyObject {
    func displaySomething(viewModel: ExploreViewModel)
}

class ExplorePresenter: ExplorePresenterInput {
    weak var output: ExplorePresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(response: ExploreResponse) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ExploreViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
