//
//  NotificationsPresenter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol NotificationsPresenterInput: AnyObject {
    func presentSomething(response: NotificationsResponse)
}

protocol NotificationsPresenterOutput: AnyObject {
    func displaySomething(viewModel: NotificationsViewModel)
}

class NotificationsPresenter: NotificationsPresenterInput {
    weak var output: NotificationsPresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(response: NotificationsResponse) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = NotificationsViewModel()
        output?.displaySomething(viewModel: viewModel)
    }
}
