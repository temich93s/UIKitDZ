//
//  GameViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// GameViewController - игра, второй экран
class GameViewController: UIViewController {

    let game = Game()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 200, height: 80)
        label.backgroundColor = .orange
        label.text = "Результат"
        label.textAlignment = .center
        return label
    }()
    lazy var startGameButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 400, width: 200, height: 80)
        button.backgroundColor = .orange
        button.setTitle("Начать игру", for: .normal)
        button.addTarget(self, action: #selector(startGameAction), for: .touchUpInside)
        return button
    }()
    var emojiLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 500, width: 200, height: 80)
        label.backgroundColor = .orange
        label.textAlignment = .center
        label.text = "😐"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc func startGameAction() {
        let actionController = UIAlertController(
            title: "Словечко",
            message: "Введи кодовое слово",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "ВВОД", style: .default) { _ in
            guard let safeText = actionController.textFields?.first?.text else { return }
            let (resultText, emoji) = self.game.checkWord(safeText)
            self.emojiLabel.text = emoji
            self.resultLabel.text = resultText
        }
        actionController.addTextField(configurationHandler: nil)
        actionController.addAction(alertAction)
        present(actionController, animated: true, completion: nil)
    }
    
    private func setUI() {
        view.addSubview(resultLabel)
        view.addSubview(startGameButton)
        view.addSubview(emojiLabel)
    }
}
