//
//  GameModel.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import Foundation

/// GameModel - модель нашего приложения
struct Game {
    func checkWord(_ currentWord: String) -> (String, String) {
        guard currentWord == "leohl" else {
            return ("...", "🤐")
        }
        return ("Hello", "🤩")
    }
}
