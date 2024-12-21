//
//  ViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 29.09.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    //MARK: - Properties
    private lazy var label = UILabel()
    
    //MARK: - Initializers
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addSubViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpLayout()
    }
    
    //MARK: - Setup Views Methods
    
    //MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .systemBackground
        label.text = "Hello, World!"
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
