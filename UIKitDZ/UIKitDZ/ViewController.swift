//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// StartViewController - стартовый ViewController
class StartViewController: UIViewController {

    var fioLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 200, height: 80)
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.text = "ФИО"
        return label
    }()
    var resultGuessNumberLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.text = "Сыграем?"
        return label
    }()
    lazy var guessNumberButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 80)
        button.backgroundColor = .orange
        button.setTitle("Угадай число", for: .normal)
        button.addTarget(self, action: #selector(buttonGuessNumberAction), for: .touchUpInside)
        return button
    }()
    var sumLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 500, width: 200, height: 80)
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.text = "Результат суммы"
        return label
    }()
    lazy var sumButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 600, width: 200, height: 80)
        button.backgroundColor = .orange
        button.setTitle("Сложить числа", for: .normal)
        button.addTarget(self, action: #selector(buttonSumAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        createStartAlert()
    }
    
    @objc func buttonGuessNumberAction() {
        let alertController = UIAlertController(
            title: "Угадайка",
            message: "Я загадал число от 1 до 3, угадай что это за число?",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "Проверить ответ!", style: .default) { _ in
            guard
               let safeText = alertController.textFields?.first?.text,
               let userNumber = Int(safeText)
            else {
               return
            }
            let solveNumber = Int.random(in: 1...3)
            if userNumber == solveNumber {
                self.resultGuessNumberLabel.text = "Угадал! Молодечик! 😜"
            } else {
                self.resultGuessNumberLabel.text = "Не угадал... 😢"
            }
            print(solveNumber)
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func buttonSumAction() {
        let alertController = UIAlertController(
            title: "Сумма",
            message: "Введите число 1 и число 2, каждое в отдельное текстовое поле",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "ОК", style: .default) { _ in
            guard
                alertController.textFields?.count == 2,
                let safeTextFieldOne = alertController.textFields?.first?.text,
                let safeTextFieldTwo = alertController.textFields?[1].text,
                let numberOne = Int(safeTextFieldOne),
                let numberTwo = Int(safeTextFieldTwo)
            else {
               return
            }
            self.sumLabel.text = ("\(numberOne+numberTwo)")
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func setUI() {
        view.addSubview(fioLabel)
        view.addSubview(resultGuessNumberLabel)
        view.addSubview(guessNumberButton)
        view.addSubview(sumLabel)
        view.addSubview(sumButton)
    }
    
    private func createStartAlert() {
        let alertController = UIAlertController(title: "ФИО", message: "Введите ФИО", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default) { _ in
            if let safeText = alertController.textFields?.first?.text {
                self.fioLabel.text = safeText
            }
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
