//
//  DataModel.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import Foundation

///  Синглтон, тут хранятся все данные
struct DataModel {
    static var email: String?
    static var password: String?
    static var fio: String?
    static var numberGuest: String?
    static var numberTable: String?
    static var booking: Bool? = false
    static var prepayment: Bool? = false
    static var vip: Bool? = false
}
