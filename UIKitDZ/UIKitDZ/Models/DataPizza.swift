//
//  DataPizza.swift
//  UIKitDZ
//
//  Created by 2lup on 29.09.2022.
//

import Foundation

/// DataPizza: Данные о пицце
/// - namePizza: Название пиццы
/// - nameImagePizza: имя изобржения пиццы
/// - ingredientsPizza: ингридиент пиццы и наличие в пицце данного ингридиента
/// - compositionPizza: состав пиццы
/// - kkalPizza: БЖУ и ккал пиццы
struct DataPizza {
    var namePizza = ""
    var nameImagePizza = ""
    var ingredientsPizza = [(nameIngredient: "", availabilityIngredient: true)]
    var compositionPizza = ""
    var kkalPizza = (proteins: "", fats: "", carbohydrates: "", kkal: "")
}
