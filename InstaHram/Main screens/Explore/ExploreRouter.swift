//
//  ExploreRouter.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol ExploreRouterInput: AnyObject {
    func navigateToSomewhere(with data: Any?)
}

class ExploreRouter/*: ExploreRouterInput*/ {
    weak var viewController: ExploreViewController?
    
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
