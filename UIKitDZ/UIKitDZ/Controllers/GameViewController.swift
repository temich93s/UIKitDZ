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
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var buttonStartGame: UIButton!
    @IBOutlet weak var labelEmoji: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonStartGameAction(_ sender: UIButton) {
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
