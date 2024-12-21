//
//  FeedConfigurator.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

extension FeedViewController: FeedPresenterOutput {
    
}

extension FeedInteractor: FeedViewControllerOutput {
    
}

extension FeedPresenter: FeedInteractorOutput {
    
}

class FeedConfigurator {
    static let shared = FeedConfigurator()
    private init() {}
        
    func configure(viewController: FeedViewController) {
        let router = FeedRouter()
        router.viewController = viewController
        
        let presenter = FeedPresenter()
        presenter.output = viewController
        
        let interactor = FeedInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
