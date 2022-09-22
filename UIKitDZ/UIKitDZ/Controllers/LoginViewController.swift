//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import UIKit

/// LoginViewController
class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.delegate = self
        password.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func eyeButtonPress(_ sender: UIButton) {
        password.isSecureTextEntry.toggle()
    }
    
    @IBAction func enterPress(_ sender: UIButton) {
        DataModel.email = email.text
        DataModel.password = password.text
        
        guard let safeEmail = DataModel.email,
              let safePassword = DataModel.password else { return }
        guard !safeEmail.isEmpty, !safePassword.isEmpty else { return }
        
        print("DataModel.email: \(safeEmail), DataModel.password: \(safePassword)")
        performSegue(withIdentifier: "CreateAccount", sender: self)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    // Спрашивает делегата, следует ли обрабатывать нажатие кнопки Return для текстового поля.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Приводит к тому, что представление (или одно из его встроенных текстовых полей) отойдет из статуса первого ответчика.
        self.view.endEditing(true)
        return true
    }
}
