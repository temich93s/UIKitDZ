//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 28.09.2022.
//

import UIKit

// LoginViewController: экран авторизации
class LoginViewController: UIViewController {

    private let logoImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "Logo")
        return $0
    }(UIImageView())
    
    private let emailLabel: UILabel = {
        $0.text = "Email"
        $0.font = UIFont(name: "Verdana", size: 20)
        $0.textColor = .systemCyan
        return $0
    }(UILabel())
    
    private let emailTextField: UITextField = {
        $0.placeholder = "890000000"
        $0.font = UIFont(name: "Verdana", size: 20)
        $0.textColor = .black
        $0.keyboardType = .asciiCapableNumberPad
        return $0
    }(UITextField())
    
    private let passwordLabel: UILabel = {
        $0.text = "Password"
        $0.font = UIFont(name: "Verdana", size: 20)
        $0.textColor = .systemCyan
        return $0
    }(UILabel())
    
    private let passwordTextField: UITextField = {
        $0.placeholder = "password"
        $0.font = UIFont(name: "Verdana", size: 20)
        $0.textColor = .black
        return $0
    }(UITextField())
    
    private lazy var enterButton: UIButton = {
        $0.setTitle("Войти", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        $0.backgroundColor = .systemCyan
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(enterButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegateAndDataSource()
    }
    
    @objc private func dismissKeyboardAction() {
        view.endEditing(true)
    }
    
    @objc private func enterButtonAction() {
        let foodViewController = FoodViewController()
        navigationController?.pushViewController(foodViewController, animated: false)
    }
    
    private func setDelegateAndDataSource() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setUI() {
        enterButton.layer.cornerRadius = 10
        view.backgroundColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardAction))
        view.addGestureRecognizer(tap)
        
        logoImageView.frame = CGRect(x: view.bounds.width / 2 - 50, y: 100, width: 80, height: 100)
        emailLabel.frame = CGRect(x: 30, y: 300, width: 350, height: 40)
        emailTextField.frame = CGRect(x: 30, y: 350, width: 350, height: 40)
        passwordLabel.frame = CGRect(x: 30, y: 400, width: 350, height: 40)
        passwordTextField.frame = CGRect(x: 30, y: 450, width: 350, height: 40)
        enterButton.frame = CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height - 300, width: 300, height: 40)
        
        view.addSubview(logoImageView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(enterButton)
    }

}

/// UITextFieldDelegate: закрываем клавиатуру по нажатию Return
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
