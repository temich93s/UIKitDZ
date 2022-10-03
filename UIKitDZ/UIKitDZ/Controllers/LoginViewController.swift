//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 03.10.2022.
//

import UIKit

/// Экран авторизации
final class LoginViewController: UIViewController {

    @IBOutlet weak var nicknameTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    
    private var usersArray: [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setNotificationCenter()
    }

    @IBAction func registrationButtonAction(_ sender: UIButton) {
        guard
            let safeNicknameText = nicknameTextView.text,
            let safeEmailText = emailTextView.text,
            let safePasswordText = passwordTextView.text,
            !safeNicknameText.isEmpty && !safeEmailText.isEmpty && !safePasswordText.isEmpty
        else {
            return
        }
        usersArray.append(
            UserData(
                nicknameUser: safeNicknameText,
                emailUser: safeEmailText,
                passwordUser: safePasswordText
            )
        )
        registrationAlert()
        nicknameTextView.text = ""
        emailTextView.text = ""
        passwordTextView.text = ""
    }
    
    @IBAction func enterButtonAction(_ sender: UIButton) {
        var userExisting = false
        guard
            let safeNicknameUser = nicknameTextView.text,
            let safeEmailUser = emailTextView.text,
            let safePasswordUser = passwordTextView.text,
            !safeNicknameUser.isEmpty && !safeEmailUser.isEmpty && !safePasswordUser.isEmpty
        else {
            return
        }
        for userData in usersArray {
            guard
                safeNicknameUser == userData.nicknameUser,
                safeEmailUser == userData.emailUser,
                safePasswordUser == userData.passwordUser
            else {
                continue
            }
            userExisting = true
        }
        guard
            userExisting
        else {
            unsuccessfulAlert()
            return
        }
        successAlert()
    }
    
    private func unsuccessfulAlert() {
        let alertController = UIAlertController(
            title: "Неудачный вход",
            message: "Учетная запись не найдена",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func registrationAlert() {
        let alertController = UIAlertController(
            title: "Учетная запись зарегистрирована",
            message: "",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func successAlert() {
        let alertController = UIAlertController(
            title: "Успешный вход",
            message: "Учетная запись найдена",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "ОК", style: .default) { _ in
            self.performSegue(withIdentifier: "login", sender: self)
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func setDelegate() {
        nicknameTextView.delegate = self
        emailTextView.delegate = self
        passwordTextView.delegate = self
    }
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = -200.0
        }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = 0.0
        }
    }
    
}

/// Подписываемся на отслеживание событий у UITextField
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nicknameTextView:
            emailTextView.becomeFirstResponder()
        case emailTextView:
            passwordTextView.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case nicknameTextView:
                return true
        case emailTextView:
            guard
                let safeNicknameText = nicknameTextView.text,
                safeNicknameText.isEmpty
            else {
                return true
            }
            return false
        case passwordTextView:
            guard
                let safeNicknameText = nicknameTextView.text,
                let safeEmailText = emailTextView.text,
                safeNicknameText.isEmpty || safeEmailText.isEmpty
            else {
                return true
            }
            return false
        default:
            return false
        }
    }
}
