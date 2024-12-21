//
//  ExploreConfigurator.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

extension ExploreViewController: ExplorePresenterOutput {
    
}

extension ExploreInteractor: ExploreViewControllerOutput {
    
}

extension ExplorePresenter: ExploreInteractorOutput {
    
}

class ExploreConfigurator {
    static let shared = ExploreConfigurator()
    private init() {}
    
    func configure(viewController: ExploreViewController) {
        let router = ExploreRouter()
        router.viewController = viewController
        
        let presenter = ExplorePresenter()
        presenter.output = viewController
        
        let interactor = ExploreInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
