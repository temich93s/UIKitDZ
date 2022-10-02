//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// ViewController
class Conspect: UIViewController, UITextFieldDelegate {

    var myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        myTextField.delegate = self
        myTextField.becomeFirstResponder()
        
        // NotificationCenter - Механизм отправки уведомлений, который позволяет передавать информацию зарегистрированным наблюдателям.
        // default - Центр уведомлений приложения по умолчанию.
        // addObserver - Добавляет запись в центр уведомлений для вызова предоставленного селектора с уведомлением.
        // - observer - кто наблюдатель (мы - ViewController)
        // - selector - что выполнить
        // - name - Название уведомления, которое необходимо зарегистрировать для доставки наблюдателю.
        // - object - Объект, который отправляет уведомления наблюдателю. Укажите отправителя уведомлений, чтобы доставлять уведомления только от этого отправителя.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textFieldTextDidChange),
            name: UITextField.textDidChangeNotification,
            object: nil
        )
        
        // клавиатура появляется на экране
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = -200.0
        }
        
        // клавиатура скрывается с экрана
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { _ in
            self.view.frame.origin.y = 0.0
        }
    }

    // MARK: - CreateUI
    func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = .roundedRect
        myTextField.contentVerticalAlignment = .center
        myTextField.textAlignment = .center
        myTextField.placeholder = "I swift developer"
        myTextField.center = view.center
        view.addSubview(myTextField)
    }
    
    // MARK: - Notification
    @objc func textFieldTextDidChange(ncParam: NSNotification) {
        print("textFieldTextDidChange = \(ncParam)")
    }
    
    // MARK: - UITextField
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == myTextField {
            print("textFieldShouldBeginEditing = можно ли редактировать текстовое поле")
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing = внимание началось редактирование текста")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing = запускается перед закрытием текстового поля."
              + " Спрашивает делегата, должно ли редактирование останавливаться в текстовом поле.")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing = Сообщает делегату, что редактирование остановилось для текстового поля.")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing = Сообщает делегату, что текстовое поле было очищено")
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        print("shouldChangeCharactersIn = вы ввели символ \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear = Запрашивает делегата, следует ли удалять текущее содержимое текстового поля.")
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear = Запрашивает делегата, следует ли обрабатывать нажатие Return текстового поля.")
        if textField == myTextField {
            myTextField.resignFirstResponder()
        }
        return true
    }
}
