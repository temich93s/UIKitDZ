//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 03.10.2022.
//

import UIKit

/// Экран авторизации
final class LoginViewController: UIViewController {

    private enum Constants {
        static let emptyText = ""
        static let okText = "OK"
        static let segueId = "login"
        static let unsuccessfulEnterTitle = "Неудачный вход"
        static let unsuccessfulEnterMessage = "Учетная запись не найдена"
        static let registrationTitle = "Учетная запись зарегистрирована"
        static let successEnterTitle = "Успешный вход"
        static let successEnterMessage = "Учетная запись найдена"
        static let UpUIWhenkeyboardWillShow = -200.0
        static let DownUIWhenkeyboardWillShow = 0.0
    }
    
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
        nicknameTextView.text = Constants.emptyText
        emailTextView.text = Constants.emptyText
        passwordTextView.text = Constants.emptyText
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
            title: Constants.unsuccessfulEnterTitle,
            message: Constants.unsuccessfulEnterMessage,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: Constants.okText, style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func registrationAlert() {
        let alertController = UIAlertController(
            title: Constants.registrationTitle,
            message: Constants.emptyText,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: Constants.okText, style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    private func successAlert() {
        let alertController = UIAlertController(
            title: Constants.successEnterTitle,
            message: Constants.successEnterMessage,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: Constants.okText, style: .default) { _ in
            self.performSegue(withIdentifier: Constants.segueId, sender: self)
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
            self.view.frame.origin.y = Constants.UpUIWhenkeyboardWillShow
        }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = Constants.DownUIWhenkeyboardWillShow
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
