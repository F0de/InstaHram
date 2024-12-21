//
//  FeedPresenter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 17.10.2024.
//

import UIKit

protocol FeedPresenterInput: AnyObject {
    func presentSomething(response: FeedResponse)
}

protocol FeedPresenterOutput: AnyObject {
    func displaySomething(viewModel: FeedViewModel)
}

class FeedPresenter: FeedPresenterInput {
    weak var output: FeedPresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(response: FeedResponse) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = FeedViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
