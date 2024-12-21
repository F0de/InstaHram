//
//  NotificationsViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol NotificationsViewControllerInput: AnyObject {
    func displaySomething(viewModel: NotificationsViewModel)
}

protocol NotificationsViewControllerOutput: AnyObject {
    func doSomething(request: NotificationsRequest)
}

class NotificationsViewController: UIViewController, NotificationsViewControllerInput {
    var output: NotificationsViewControllerOutput?
    var router: NotificationsRouter?
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationsConfigurator.shared.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Event handling
    func doSomething() {
        // NOTE: Ask the Interactor to do some work
        let request = NotificationsRequest()
        output?.doSomething(request: request)
    }
    
    // MARK: Display logic
    func displaySomething(viewModel: NotificationsViewModel) {
        // NOTE: Display the result from the Presenter
    }
}
