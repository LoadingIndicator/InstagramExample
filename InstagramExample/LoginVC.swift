//
//  LoginVC.swift
//  InstagramExample
//
//  Created by Nicolas Spinner on 21.12.20.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet private var mainStackView: UIStackView!
    @IBOutlet private var mainStackViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet private var instagramImageView: UIImageView!
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var forgotPasswordButton: UIButton!
    @IBOutlet private var loginButton: UIButton!
    @IBOutlet private var separatorLabel: UILabel!
    @IBOutlet private var separatorStackView: UIStackView!
    @IBOutlet private var facebookButton: UIButton!
    
    @IBOutlet private var legalButton: UIButton!
    @IBOutlet private var noAccountLabel: UILabel!
    @IBOutlet private var signupButton: UIButton!
    
    private var mainStackViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextFields()
        setupButtons()
        setupLabels()
        setupCustomSpacing(keyboardVisible: false)
        setupDismissKeyboardGesture()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                name: UIResponder.keyboardWillHideNotification, object: nil)
        mainStackViewTopConstraint = mainStackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16
        )
    }
    
    @objc private func keyboardWillShow() {
        mainStackViewCenterYConstraint.isActive = false
        mainStackViewTopConstraint.isActive = true
        setupCustomSpacing(keyboardVisible: true)
//        instagramImageView.isHidden = true
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillHide() {
        mainStackViewCenterYConstraint.isActive = true
        mainStackViewTopConstraint.isActive = false
        setupCustomSpacing(keyboardVisible: false)
//        instagramImageView.isHidden = false
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    private func setupDismissKeyboardGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupTextFields() {
        usernameTextField.font = .scaledSystemFont(size: 14)
        passwordTextField.font = .scaledSystemFont(size: 14)
        
        usernameTextField.setPlaceholder("Phone number, username or email address")
        passwordTextField.setPlaceholder("Password")
    }
    
    private func setupLabels() {
        separatorLabel.font = .scaledSystemFont(size: 13, weight: .medium)
        noAccountLabel.font = .scaledSystemFont(size: 12)
        noAccountLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setupButtons() {
        setupForgotPasswordButton()
        setupLoginButton()
        setupFacebookButton()
        setupBottomButtons()
    }
    
    private func setupForgotPasswordButton() {
        forgotPasswordButton.titleLabel?.font = .scaledSystemFont(size: 13, weight: .medium)
    }
    
    private func setupLoginButton() {
        loginButton.titleLabel?.font = .scaledSystemFont(size: 15, weight: .medium)
        loginButton.layer.cornerRadius = 5
    }

    private func setupFacebookButton() {
        facebookButton.imageView?.contentMode = .scaleAspectFit
        facebookButton.titleLabel?.font = .scaledSystemFont(size: 14, weight: .medium)
        facebookButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    private func setupBottomButtons() {
        legalButton.titleLabel?.font = .scaledSystemFont(size: 12, weight: .medium)
        legalButton.titleLabel?.adjustsFontSizeToFitWidth = true
        signupButton.titleLabel?.font = .scaledSystemFont(size: 12, weight: .medium)
    }
    
    private func setupCustomSpacing(keyboardVisible: Bool) {
        mainStackView.setCustomSpacing(keyboardVisible ? 8 : 12, after: passwordTextField)
        mainStackView.setCustomSpacing(keyboardVisible ? 16 : 24, after: forgotPasswordButton)
        mainStackView.setCustomSpacing(keyboardVisible ? 16 : 24, after: loginButton)
        mainStackView.setCustomSpacing(keyboardVisible ? 16 : 40, after: separatorStackView)
    }

}

private extension UITextField {

    func setPlaceholder(_ placeholder: String) {
        attributedPlaceholder = NSAttributedString(string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
    }

}
