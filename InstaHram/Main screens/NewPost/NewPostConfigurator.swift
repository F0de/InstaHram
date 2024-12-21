//
//  NewPostConfigurator.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

extension NewPostViewController: NewPostPresenterOutput {
    
}

extension NewPostInteractor: NewPostViewControllerOutput {
    
}

extension NewPostPresenter: NewPostInteractorOutput {
    
}

class NewPostConfigurator {
    static let shared = NewPostConfigurator()
    private init() {}
    
    func configure(viewController: NewPostViewController) {
        let router = NewPostRouter()
        router.viewController = viewController
        
        let presenter = NewPostPresenter()
        presenter.output = viewController
        
        let interactor = NewPostInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
