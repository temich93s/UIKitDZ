//
//  PersonBMIData.swift
//  UIKitDZ
//
//  Created by 2lup on 03.10.2022.
//

import Foundation

/// PersonBMIData: Данные по расчету ИМТ человека
/// - Prediction: предположение пользователя о результате
///   - shortage: недобор веса
///   - normally: нормальный вес
///   - surplus: избытток веса
/// - personWeight: вес человека
/// - personHeight: рост человека
struct PersonBMIData {
    
    enum Prediction {
        case shortage
        case normally
        case surplus
    }
    
    var personPrediction: Prediction = .shortage
    var personWeight: Float = 0.0
    var personHeight: Float = 0.0
}
