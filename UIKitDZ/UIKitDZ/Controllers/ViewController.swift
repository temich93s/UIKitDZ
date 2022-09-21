//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// ViewController
class ViewController: UIViewController {

    @IBOutlet weak var labelFIO: UILabel!
    @IBOutlet weak var labelResultGuessNumber: UILabel!
    @IBOutlet weak var buttonGuessNumber: UIButton!
    @IBOutlet weak var labelSum: UILabel!
    @IBOutlet weak var buttonSum: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func actionButtonGuessNumber(_ sender: UIButton) {
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
    
    @IBAction func actionButtonSum(_ sender: UIButton) {
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
