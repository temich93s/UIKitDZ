//
//  DataModel.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import Foundation

/// Data - Структура в которой хранятся все данные о заказе
/// - email: Электронная поста покупателя
/// - password: Пароль от учетной записи покупателя
/// - fio: ФИО покупателя
/// - numberGuest: Кол-во гостей
/// - numberTable: Номер столика
/// - booking: Был ли забронирован стол заранее
/// - prepayment: Была ли предоплата
/// - vip: VIP столик
struct Data {
    var email: String?
    var password: String?
    var fio: String?
    var numberGuest: String?
    var numberTable: String?
    var booking: Bool? = false
    var prepayment: Bool? = false
    var vip: Bool? = false
}
