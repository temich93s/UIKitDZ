//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// ViewController
class ViewController: UIViewController {

    var labelFIO: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 200, height: 80)
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.text = "ФИО"
        return label
    }()
    var labelResultGuessNumber: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.text = "Сыграем?"
        return label
    }()
    lazy var buttonGuessNumber: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 80)
        button.backgroundColor = UIColor.orange
        button.setTitle("Угадай число", for: .normal)
        button.addTarget(self, action: #selector(actionButtonGuessNumber), for: .touchUpInside)
        return button
    }()
    var labelSum: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 500, width: 200, height: 80)
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.text = "Результат суммы"
        return label
    }()
    lazy var buttonSum: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 600, width: 200, height: 80)
        button.backgroundColor = UIColor.orange
        button.setTitle("Сложить числа", for: .normal)
        button.addTarget(self, action: #selector(actionButtonSum), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(labelFIO)
        self.view.addSubview(labelResultGuessNumber)
        self.view.addSubview(buttonGuessNumber)
        self.view.addSubview(labelSum)
        self.view.addSubview(buttonSum)
    }

    override func viewDidAppear(_ animated: Bool) {
        let alertController = UIAlertController(title: "ФИО", message: "Введите ФИО", preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .default) { _ in
            if let safeText = alertController.textFields?.first?.text {
                self.labelFIO.text = safeText
            }
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func actionButtonGuessNumber() {
        let alertController = UIAlertController(
            title: "Угадайка",
            message: "Я загадал число от 1 до 3, угадай что это за число?",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Проверить ответ!", style: .default) { _ in
            guard let safeText = alertController.textFields?.first?.text else { return }
            guard let userNumber = Int(safeText) else { return }
            let solveNumber = Int.random(in: 1...3)
            if userNumber == solveNumber {
                self.labelResultGuessNumber.text = "Угадал! Молодечик! 😜"
            } else {
                self.labelResultGuessNumber.text = "Не угадал... 😢"
            }
            print(solveNumber)
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func actionButtonSum() {
        let alertController = UIAlertController(
            title: "Сумма",
            message: "Введите число 1 и число 2, каждое в отдельное текстовое поле",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "ОК", style: .default) { _ in
            guard let safeTextFieldOne = alertController.textFields?.first?.text,
                    let safeTextFieldTwo = alertController.textFields?[1].text else { return }
            guard let numberOne = Int(safeTextFieldOne), let numberTwo = Int(safeTextFieldTwo) else { return }
            self.labelSum.text = String(numberOne + numberTwo)
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
