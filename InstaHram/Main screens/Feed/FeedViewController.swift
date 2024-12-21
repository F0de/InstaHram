//
//  FeedViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 17.10.2024.
//

import UIKit
import SnapKit

protocol FeedViewControllerInput: AnyObject {
    func displaySomething(viewModel: FeedViewModel)
}
 
protocol FeedViewControllerOutput: AnyObject {
    func doSomething(request: FeedRequest)
}

class FeedViewController: UIViewController, FeedViewControllerInput {
    //MARK: - Properties
    var output: FeedViewControllerOutput?
    var router: FeedRouter?
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        FeedConfigurator.shared.configure(viewController: self)
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
        let request = FeedRequest()
        output?.doSomething(request: request)
    }
    
    // MARK: Display logic
    func displaySomething(viewModel: FeedViewModel) {
        // NOTE: Display the result from the Presenter
    }
    
    //MARK: - Setup Views Methods
    private func setupNaviagationBar() {
        let instagramLabel = UILabel()
        instagramLabel.text = "Instagram"
        instagramLabel.font = UIFont(name: "Grandista", size: 18)
        instagramLabel.textColor = .label
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: instagramLabel)
        
        let directIcon = UIImage(systemName: "paperplane")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: directIcon, style: .plain, target: nil, action: nil)
        
        navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.label]
    }
    
    //MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .systemBackground

        setupNaviagationBar()
    }
    
    //MARK: - Setting
    private func addSubViews() {

    }
    
    //MARK: - Layout
    private func setUpLayout() {
        
    }
    
    //MARK: - Actions
}
