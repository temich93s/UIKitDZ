//
//  PersonBMIData.swift
//  UIKitDZ
//
//  Created by 2lup on 03.10.2022.
//

import Foundation

// MARK: - PersonBMIData

/// PersonBMIData: Данные по расчету ИМТ человека
/// - Prediction: предположение пользователя о результате
///   - shortage: недобор веса
///   - normally: нормальный вес
///   - surplus: избытток веса
/// - personWeight: вес человека
/// - personHeight: рост человека
struct PersonBMIData {
    
    // MARK: - Enums
    
    enum Prediction {
        case shortage
        case normally
        case surplus
    }
    
    // MARK: - Public Properties
    
    var personPrediction: Prediction = .shortage
    var personWeight = Constants.numberZero
    var personHeight = Constants.numberZero
    
    // MARK: - Constants
    
    private enum Constants {
        static let numberZero: Float = 0.0
    }
}
