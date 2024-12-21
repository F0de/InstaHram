//
//  SignUpConfigurator.swift
//  InstaHram
//
//  Created by Влад Тимчук on 16.11.2024.
//


import UIKit

extension SignUpViewController: SignUpPresenterOutput {
    func displaySomething(viewModel: SignUpViewModel) {
        
    }
}

//extension SignUpInteractor: SignUpViewControllerOutput {
//
//}

extension SignUpPresenter: SignUpInteractorOutput {
    
}

class SignUpConfigurator {
    static let shared = SignUpConfigurator()
    private init() {}
    
    func configure(viewController: SignUpViewController) {
        let router = SignUpRouter()
        router.viewController = viewController
        
        let presenter = SignUpPresenter()
        presenter.output = viewController
        
        let interactor = SignUpInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
