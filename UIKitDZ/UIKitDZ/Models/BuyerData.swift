//
//  BuyerData.swift
//  UIKitDZ
//
//  Created by 2lup on 26.09.2022.
//

import Foundation

/// BuyerData: Данные о покупателе
/// - fioBuyer: Имя продукта
/// - birthdayBuyer: День рождения покупателя
/// - addressBuyer: Адрес покупателя
/// - deliveryByCourier: Будет ли доставка курьером
/// - chooseProduct: Данные о выбранном продукте
struct BuyerData {
    var fioBuyer = ""
    var birthdayBuyer = ""
    var addressBuyer = ""
    var deliveryByCourier = false
    var chooseProduct = ProductData()
}
