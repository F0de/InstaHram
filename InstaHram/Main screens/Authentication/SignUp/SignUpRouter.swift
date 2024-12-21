//
//  AuthRouterInput.swift
//  InstaHram
//
//  Created by Влад Тимчук on 16.11.2024.
//


import UIKit

protocol SignUpRouterInput: AnyObject {
    func navigateToSomewhere(with data: Any?)
}

class SignUpRouter/*: AuthRouterInput*/ {
    weak var viewController: SignUpViewController?
    
    // MARK: - Navigation
    //    func navigateToSomewhere(with data: Any?) {
    //        let nextViewController = SomeWhereViewController()
    //        if let someData = data {
    //            passDataToSomewhereScene(destination: nextViewController, data: someData)
    //        }
    //
    //        if let navigationController = viewController?.navigationController {
    //            // Push
    //            navigationController.pushViewController(nextViewController, animated: true)
    //        } else {
    //            // Modal
    //            viewController?.present(nextViewController, animated: true, completion: nil)
    //        }
    //    }
    
    // MARK: - Data Passing
    //    func passDataToSomewhereScene(destination: SomeWhereViewController, data: Any) {
    //        destination.someData = data as? String
    //    }
}
