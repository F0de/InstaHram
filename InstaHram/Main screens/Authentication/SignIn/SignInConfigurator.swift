//
//  SignInConfigurator.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

extension SignInViewController: SignInPresenterOutput {
    func displaySomething(viewModel: SignInViewModel) {
        
    }
}

//extension SignInInteractor: SignInViewControllerOutput {
//    
//}

extension SignInPresenter: SignInInteractorOutput {
    
}

class SignInConfigurator {
    static let shared = SignInConfigurator()
    private init() {}
    
    func configure(viewController: SignInViewController) {
        let router = SignInRouter()
        router.viewController = viewController
        
        let presenter = SignInPresenter()
        presenter.output = viewController
        
        let interactor = SignInInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
