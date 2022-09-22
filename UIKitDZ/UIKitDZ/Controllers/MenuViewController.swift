//
//  MenuViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import UIKit

/// MenuViewController
class MenuViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fio: UITextField!
    @IBOutlet weak var numberGuests: UITextField!
    @IBOutlet weak var numberTable: UITextField!
    
    @IBOutlet weak var booking: UISwitch!
    @IBOutlet weak var prepayment: UISwitch!
    @IBOutlet weak var vip: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fio.delegate = self
        numberGuests.delegate = self
        numberTable.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func bookingChange(_ sender: UISwitch) {
        DataModel.booking?.toggle()
        if let safeStatus = DataModel.booking {
            print("DataModel.booking: \(safeStatus)")
        }
    }
    
    @IBAction func prepaymentChange(_ sender: UISwitch) {
        DataModel.prepayment?.toggle()
        if let safeStatus = DataModel.prepayment {
            print("DataModel.prepayment: \(safeStatus)")
        }
    }
    
    @IBAction func vipChange(_ sender: UISwitch) {
        DataModel.vip?.toggle()
        if let safeStatus = DataModel.vip {
            print("DataModel.vip: \(safeStatus)")
        }
    }
    
    @IBAction func buttonBillPress(_ sender: UIButton) {
        DataModel.fio = fio.text
        DataModel.numberGuest = numberGuests.text
        DataModel.numberTable = numberTable.text
        guard let safeFio = DataModel.fio,
              let safeNumberGuest = DataModel.numberGuest,
              let safeNumberTable = DataModel.numberTable else { return }
        guard !safeFio.isEmpty,
              let safeNumberTableInt = Int(safeNumberTable),
              let safeNumberGuestInt = Int(safeNumberGuest) else { return }
        let actionController = UIAlertController(
            title: "Выставить чек?",
            message: """
                fio: \(safeFio),
                numberGuest: \(safeNumberGuestInt),
                numberTable: \(safeNumberTableInt)
                """,
            preferredStyle: .alert
        )
        let actionCancel = UIAlertAction(title: "Cancel", style: .default)
        let actionBill = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "Check", sender: self)
        }
        actionController.addAction(actionCancel)
        actionController.addAction(actionBill)
        self.present(actionController, animated: true, completion: nil)
        self.view.endEditing(true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Спрашивает делегата, следует ли обрабатывать нажатие кнопки Return для текстового поля.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Приводит к тому, что представление (или одно из его встроенных текстовых полей) отойдет из статуса первого ответчика.
        self.view.endEditing(true)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is BillViewController {
            if let safeFio = DataModel.fio,
                let safeNumberGuest = DataModel.numberGuest,
                let safeNumberTable = DataModel.numberTable {
                print("fio: \(safeFio), numberGuest: \(safeNumberGuest), numberTable: \(safeNumberTable)")
            }
        }
    }
        
}
