//
//  BillViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import UIKit

/// BillViewController - экран где отображаются данные по счеты
class BillViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataOnUI()
    }
    
    func setDataOnUI() {
        result.textAlignment = .left
        if let safeFio = data.fio,
           let safeNumberGuest = data.numberGuest,
           let safeNumberTable = data.numberTable,
           let safeEmail = data.email,
           let safeBooking = data.booking,
           let safePrepayment = data.prepayment,
           let safeVip = data.vip {
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
