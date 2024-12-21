//
//  SignInViewController.swift
//  InstaHram
//
//  Created by Влад Тимчук on 18.10.2024.
//

import UIKit
import SnapKit
import FacebookLogin


protocol SignInViewControllerInput: AnyObject {
    func displaySomething(viewModel: AuthWorker)
}

protocol SignInViewControllerOutput: AnyObject {
    func authenticate(with request: SignInRequest) async
}

class SignInViewController: UIViewController, SignInViewControllerInput {
    //MARK: - Properties
    var output: SignInViewControllerOutput?
    var router: SignInRouter?
    
    private lazy var loginButton = FBLoginButton()
    private lazy var emailTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    let button = UIButton(type: .roundedRect)
    let button2 = UIButton(type: .roundedRect)

    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        SignInConfigurator.shared.configure(viewController: self)
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
        let request = SignInRequest(type: .email(email: "testmail@gmail.com", password: "testpass"))
        await output?.authenticate(with: request)
    }
    
    // MARK: Display logic
    func displaySomething(viewModel: AuthWorker) {
        // NOTE: Display the result from the Presenter
    }
    
    //MARK: - Setup Views Methods
    private func setupEmailTextField() {
        emailTextField.textContentType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = .placeholderText
        emailTextField.layer.cornerRadius = 20
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 60))
        emailTextField.leftViewMode = .always
        emailTextField.returnKeyType = .done
        emailTextField.keyboardType = .emailAddress
    }
    
    private func setupPasswordTextField() {
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .placeholderText
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 60))
        passwordTextField.leftViewMode = .always
        passwordTextField.returnKeyType = .done
    }

    private func setupFacebookLoginButton() {
        loginButton.layer.cornerRadius = 20
    }
    
    
    //MARK: - Setting Views
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        setupEmailTextField()
        setupPasswordTextField()
        loginButton.permissions = ["public_profile", "email"]
        
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Test Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        button2.frame = CGRect(x: 130, y: 50, width: 100, height: 30)
        button2.setTitle("Test Crash3", for: [])
        button2.addTarget(self, action: #selector(self.crash3ButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button2)
    }
    
    //MARK: - Setting
    private func addSubViews() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    //MARK: - Layout
    private func setUpLayout() {
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(340)
            make.height.equalTo(60)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.height.equalTo(60)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-150)
            make.height.equalTo(60)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
    }
    
    //MARK: - Actions
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
          let numbers = [0]
          let _ = numbers[1]
      }
    
    @IBAction func crash3ButtonTapped(_ sender: AnyObject) {
        fatalError("This is test crash")
      }
}
