//
//  ProfileConfigurator.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

extension ProfileViewController: ProfilePresenterOutput {
    
}

extension ProfileInteractor: ProfileViewControllerOutput {
    
}

extension ProfilePresenter: ProfileInteractorOutput {
    
}

class ProfileConfigurator {
    static let shared = ProfileConfigurator()
    private init() {}
    
    func configure(viewController: ProfileViewController) {
        let router = ProfileRouter()
        router.viewController = viewController
        
        let presenter = ProfilePresenter()
        presenter.output = viewController
        
        let interactor = ProfileInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
