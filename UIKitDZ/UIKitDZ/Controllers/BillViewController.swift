//
//  BillViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import UIKit

/// BillViewController
class BillViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.textAlignment = .left
        if let safeFio = DataModel.fio,
           let safeNumberGuest = DataModel.numberGuest,
           let safeNumberTable = DataModel.numberTable,
           let safeEmail = DataModel.email,
           let safeBooking = DataModel.booking,
           let safePrepayment = DataModel.prepayment,
           let safeVip = DataModel.vip {
            result.text = """
                Покупатель:
                ФИО: \(safeFio),
                Количество гостей: \(safeNumberGuest),
                Номер стола: \(safeNumberTable),
                email: \(safeEmail),
                Бронировали стол - \(safeBooking ? "да" : "нет"),
                Предоплата - \(safePrepayment ? "да" : "нет"),
                VIP комната - \(safeVip ? "да" : "нет").
                
                СПАСИБО! Приходите еще!
                """
        }
    }

}
