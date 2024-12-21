//
//  NewPostViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit

protocol NewPostViewControllerInput: AnyObject {
    func displaySomething(viewModel: NewPostViewModel)
}

protocol NewPostViewControllerOutput: AnyObject {
    func doSomething(request: NewPostRequest)
}

class NewPostViewController: UIViewController, NewPostViewControllerInput {
    var output: NewPostViewControllerOutput?
    var router: NewPostRouter?
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        NewPostConfigurator.shared.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Event handling
    func doSomething() {
        // NOTE: Ask the Interactor to do some work
        let request = NewPostRequest()
        output?.doSomething(request: request)
    }
    
    // MARK: Display logic
    func displaySomething(viewModel: NewPostViewModel) {
        // NOTE: Display the result from the Presenter
    }
}
