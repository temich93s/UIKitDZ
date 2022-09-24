//
//  LoginViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import UIKit

/// LoginViewController - экран где производит индентификация и аутентификация пользователя
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "CreateAccount",
            let playerViewController = segue.destination as? MenuViewController
        else {
            return
        }
        playerViewController.data = data
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func eyeButtonPress(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func enterPress(_ sender: UIButton) {
        data.email = emailTextField.text
        data.password = passwordTextField.text
        
        guard
            let safeEmail = data.email,
            let safePassword = data.password
        else {
            return
        }
        guard !safeEmail.isEmpty, !safePassword.isEmpty else { return }
        
        print("DataModel.email: \(safeEmail), DataModel.password: \(safePassword)")
        performSegue(withIdentifier: "CreateAccount", sender: self)
    }
    
}
