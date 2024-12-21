//
//  ExploreViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit
import SnapKit

protocol ExploreViewControllerInput: AnyObject {
    func displaySomething(viewModel: ExploreViewModel)
}

protocol ExploreViewControllerOutput: AnyObject {
    func doSomething(request: ExploreRequest)
}

class ExploreViewController: UIViewController, ExploreViewControllerInput {
    //MARK: - Properties
    var output: ExploreViewControllerOutput?
    var router: ExploreRouter?
    
    private lazy var label = UILabel()

    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        ExploreConfigurator.shared.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
        
        setupViews()
        addSubViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpLayout()
    }
    
    // MARK: Event handling
    func doSomething() {
        // NOTE: Ask the Interactor to do some work
        let request = ExploreRequest()
        output?.doSomething(request: request)
    }
    
    // MARK: Display logic
    func displaySomething(viewModel: ExploreViewModel) {
        // NOTE: Display the result from the Presenter
    }
    
    //MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .systemBackground
        label.text = "This is Explore View"
        label.textColor = .cyan
    }
    
    //MARK: - Setting
    private func addSubViews() {
        view.addSubview(label)
    }
    
    //MARK: - Layout
    private func setUpLayout() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    //MARK: - Actions
}
