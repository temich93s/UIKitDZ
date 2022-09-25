//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// LoginViewController: Окно авторизации пользователя
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let logoLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .center
        $0.text = "Birthday Reminder"
        return $0
    }(UILabel())
    
    private let signInLabel: UILabel = {
        $0.textAlignment = .left
        $0.text = "Sign In"
        return $0
    }(UILabel())
    
    private let emailLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .left
        $0.text = "Email"
        return $0
    }(UILabel())
    
    private let emailTextField: UITextField = {
        $0.textAlignment = .left
        $0.placeholder = "example@email.com"
        return $0
    }(UITextField())
    
    private let passwordLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .left
        $0.text = "Password"
        return $0
    }(UILabel())
    
    private let passwordTextField: UITextField = {
        $0.textAlignment = .left
        $0.placeholder = "Password"
        $0.isSecureTextEntry = true
        return $0
    }(UITextField())

    private let eyeButton = UIButton()
    
    private let enterFaceIdLabel: UILabel = {
        $0.textAlignment = .right
        $0.text = "Вход по Face ID"
        return $0
    }(UILabel())
    
    private let enterFaceIdSwitch = UISwitch()
    
    private lazy var enterButton: UIButton = {
        $0.backgroundColor = .blue
        $0.setTitle("Войти", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(enterAccount), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func enterAccount() {
        let listBirthdayVC = ListBirthdayViewController()
        listBirthdayVC.modalPresentationStyle = .fullScreen
        present(listBirthdayVC, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(logoLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(eyeButton)
        view.addSubview(enterFaceIdLabel)
        view.addSubview(enterFaceIdSwitch)
        view.addSubview(enterButton)

        logoLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        logoLabel.center = CGPoint(x: view.center.x, y: 150)
        signInLabel.frame = CGRect(x: 40, y: 300, width: 200, height: 45)
        emailLabel.frame = CGRect(x: 40, y: 350, width: 200, height: 45)
        emailTextField.frame = CGRect(x: 40, y: 400, width: 200, height: 45)
        passwordLabel.frame = CGRect(x: 40, y: 450, width: 200, height: 45)
        passwordTextField.frame = CGRect(x: 40, y: 500, width: 200, height: 45)
        eyeButton.frame = CGRect(x: 250, y: 500, width: 200, height: 45)
        enterFaceIdLabel.frame = CGRect(x: 80, y: 550, width: 200, height: 30)
        enterFaceIdSwitch.frame = CGRect(x: 300, y: 550, width: 200, height: 45)
        enterButton.frame = CGRect(x: 0, y: 0, width: 200, height: 45)
        enterButton.center = CGPoint(x: view.center.x, y: 700)
    }
    
}
