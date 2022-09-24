//
//  MenuViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 22.09.2022.
//

import UIKit

/// MenuViewController
class MenuViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fioTextField: UITextField!
    @IBOutlet weak var numberGuestsTextField: UITextField!
    @IBOutlet weak var numberTableTextField: UITextField!
    
    @IBOutlet weak var bookingSwitch: UISwitch!
    @IBOutlet weak var prepaymentSwitch: UISwitch!
    @IBOutlet weak var vipSwitch: UISwitch!
    
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationMenuViewController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "Check",
            let safeFio = data.fio,
            let safeNumberGuest = data.numberGuest,
            let safeNumberTable = data.numberTable,
            let playerViewController = segue.destination as? BillViewController
        else {
            return
        }
        playerViewController.data = data
        print("fio: \(safeFio), numberGuest: \(safeNumberGuest), numberTable: \(safeNumberTable)")
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
        
    @IBAction func bookingChangeAction(_ sender: UISwitch) {
        data.booking?.toggle()
        if let safeStatus = data.booking {
            print("DataModel.booking: \(safeStatus)")
        }
    }
    
    @IBAction func prepaymentChangeAction(_ sender: UISwitch) {
        data.prepayment?.toggle()
        if let safeStatus = data.prepayment {
            print("DataModel.prepayment: \(safeStatus)")
        }
    }
    
    @IBAction func vipChangeAction(_ sender: UISwitch) {
        data.vip?.toggle()
        if let safeStatus = data.vip {
            print("DataModel.vip: \(safeStatus)")
        }
    }
    
    @IBAction func buttonBillPressAction(_ sender: UIButton) {
        data.fio = fioTextField.text
        data.numberGuest = numberGuestsTextField.text
        data.numberTable = numberTableTextField.text
        guard let safeFio = data.fio,
              let safeNumberGuest = data.numberGuest,
              let safeNumberTable = data.numberTable,
              !safeFio.isEmpty,
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
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        let billAction = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "Check", sender: self)
        }
        actionController.addAction(cancelAction)
        actionController.addAction(billAction)
        self.present(actionController, animated: true, completion: nil)
        self.view.endEditing(true)
    }
    
    private func configurationMenuViewController() {
        fioTextField.delegate = self
        numberGuestsTextField.delegate = self
        numberTableTextField.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIInputViewController.dismissKeyboard)
        )
        view.addGestureRecognizer(tapRecognizer)
    }
    
}
