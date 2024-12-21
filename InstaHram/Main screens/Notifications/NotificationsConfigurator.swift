//
//  NotificationsConfigurator.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

extension NotificationsViewController: NotificationsPresenterOutput {
    
}

extension NotificationsInteractor: NotificationsViewControllerOutput {
    
}

extension NotificationsPresenter: NotificationsInteractorOutput {
    
}

class NotificationsConfigurator {
    static let shared = NotificationsConfigurator()
    private init() {}
    
    func configure(viewController: NotificationsViewController) {
        let router = NotificationsRouter()
        router.viewController = viewController
        
        let presenter = NotificationsPresenter()
        presenter.output = viewController
        
        let interactor = NotificationsInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
