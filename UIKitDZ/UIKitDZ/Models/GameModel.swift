//
//  GameModel.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import Foundation

/// GameModel - модель нашего приложения
struct GameModel {
    func checkWord(_ currentWord: String) -> (String, String) {
        if currentWord == "leohl" {
            return ("Hello", "🤩")
        } else {
            return ("...", "🤐")
        }
    }
}
