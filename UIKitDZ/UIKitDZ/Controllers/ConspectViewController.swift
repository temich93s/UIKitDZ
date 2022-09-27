//
//  ConspectViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 27.09.2022.
//

import UIKit

/// ConspectViewController - тут конспект 8 урока по UIKit
class ConspectViewController: UIViewController, UITextFieldDelegate {

    var buttonShare = UIButton()
    var textField = UITextField()
    var activityVC: UIActivityViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        createButton()
    }
    
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        // self - это экземпляр ViewController
        textField.center = view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text to share"
        textField.delegate = self
        view.addSubview(textField)
    }
    
    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        buttonShare.setTitle("Расшарить", for: .normal)
        buttonShare.addTarget(self, action: #selector(hendleShare(paramSender:)), for: .touchUpInside)
        view.addSubview(buttonShare)
    }

    @objc func hendleShare(paramSender: Any) {
        let text = textField.text
        if text?.count == 0 {
            let massege = "Введите текст"
            let alertController = UIAlertController(title: nil, message: massege, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        // activityItems - массив элементов которые мы хотим расшарить
        // applicationActivities - массив объектов UIActivity, представляющих пользовательские сервисы, поддерживаемые вашим приложением. Этот параметр может быть нулевым.
        activityVC = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        if let safeActivityVC = activityVC {
            present(safeActivityVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - UITextFieldDelegate
    // textFieldShouldReturn - Запрашивает делегата, следует ли обрабатывать нажатие кнопки Return для текстового поля.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // resignFirstResponder - Уведомляет этот объект о том, что ему было предложено отказаться от статуса первого ответчика в его окне.
        textField.resignFirstResponder()
        return true
    }
    
}
