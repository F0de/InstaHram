//
//  SignUpViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 16.11.2024.
//

import UIKit
import SnapKit

protocol SignUpViewControllerInput: AnyObject {
    func displaySomething(viewModel: AuthWorker)
}

protocol SignUpViewControllerOutput: AnyObject {
    func authenticate(with request: SignUpRequest) async
}

class SignUpViewController: UIViewController, SignUpViewControllerInput {
    //MARK: - Properties
    var output: SignUpViewControllerOutput?
    var router: SignUpRouter?
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        SignUpConfigurator.shared.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await doSomething()
        }
        
        setupViews()
        addSubViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpLayout()
    }
    
    // MARK: Event handling
    func doSomething() async {
        // NOTE: Ask the Interactor to do some work
        let request = SignUpRequest(type: .email(username: "testUsername", email: "testMail@gmail.com", password: "testPass", repeatPassword: "testPass"))
        await output?.authenticate(with: request)
    }
    
    // MARK: Display logic
    func displaySomething(viewModel: AuthWorker) {
        // NOTE: Display the result from the Presenter
    }
    
    //MARK: - Setup Views Methods

    //MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        
    }
    
    //MARK: - Setting
    private func addSubViews() {

    }
    
    //MARK: - Layout
    private func setUpLayout() {
        
    }
    
    //MARK: - Actions
}
