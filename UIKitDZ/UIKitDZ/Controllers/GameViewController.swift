//
//  GameViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// GameViewController - игра, второй экран
class GameViewController: UIViewController {

    let gameModel = GameModel()
    
    var labelResult: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 200, height: 80)
        label.backgroundColor = UIColor.orange
        label.text = "Результат"
        label.textAlignment = .center
        return label
    }()
    lazy var buttonStartGame: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 80)
        button.backgroundColor = UIColor.orange
        button.setTitle("Начать игру", for: .normal)
        button.addTarget(self, action: #selector(buttonStartGameAction), for: .touchUpInside)
        return button
    }()
    var labelEmoji: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 500, width: 200, height: 80)
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.text = "😐"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(labelResult)
        self.view.addSubview(buttonStartGame)
        self.view.addSubview(labelEmoji)
    }
    
    @objc func buttonStartGameAction() {
        let actionController = UIAlertController(
            title: "Словечко",
            message: "Введи кодовое слово",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "ВВОД", style: .default) { _ in
            guard let safeText = actionController.textFields?.first?.text else { return }
            let (resultText, emoji) = self.gameModel.checkWord(safeText)
            self.labelEmoji.text = emoji
            self.labelResult.text = resultText
        }
        actionController.addTextField(configurationHandler: nil)
        actionController.addAction(action)
        self.present(actionController, animated: true, completion: nil)
    }
    
}
