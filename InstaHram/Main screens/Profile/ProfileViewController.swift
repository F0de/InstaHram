//
//  ProfileViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol ProfileViewControllerInput: AnyObject {
    func displaySomething(viewModel: ProfileViewModel)
}

protocol ProfileViewControllerOutput: AnyObject {
    func doSomething(request: ProfileRequest)
}

class ProfileViewController: UIViewController, ProfileViewControllerInput {
    var output: ProfileViewControllerOutput?
    var router: ProfileRouter?
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        ProfileConfigurator.shared.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Event handling
    func doSomething() {
        // NOTE: Ask the Interactor to do some work
        let request = ProfileRequest()
        output?.doSomething(request: request)
    }
    
    // MARK: Display logic
    func displaySomething(viewModel: ProfileViewModel) {
        // NOTE: Display the result from the Presenter
    }
}
