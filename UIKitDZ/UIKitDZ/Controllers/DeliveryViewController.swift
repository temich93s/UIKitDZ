//
//  DeliveryViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 26.09.2022.
//

import UIKit

/// DeliveryViewController - экран с указанием данных о доставки
class DeliveryViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var backButton: UIButton = {
        $0.setTitle("Отмена", for: .normal)
        $0.setTitleColor(.systemPurple, for: .normal)
        $0.addTarget(self, action: #selector(backToProductsVCAction(target:)), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private let dataForDeliveryLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = $0.font.withSize(35)
        $0.text = "Данные для доставки"
        return $0
    }(UILabel())
    
    private let fioBuyerLabel: UILabel = {
        $0.textColor = .systemPurple
        $0.textAlignment = .left
        $0.text = "ФИО"
        return $0
    }(UILabel())
    
    private let fioBuyerTextField: UITextField = {
        $0.textAlignment = .left
        $0.placeholder = "Введите ФИО"
        return $0
    }(UITextField())
    
    private let birthdayBuyerLabel: UILabel = {
        $0.textColor = .systemPurple
        $0.textAlignment = .left
        $0.text = "Дата рождения"
        return $0
    }(UILabel())
    
    private lazy var setBirthdayBuyerPickerView: UIDatePicker = {
        $0.datePickerMode = .date
        return $0
    }(UIDatePicker())
    
    private let addressBuyerLabel: UILabel = {
        $0.textColor = .systemPurple
        $0.textAlignment = .left
        $0.text = "Адрес доставки"
        return $0
    }(UILabel())
    
    private let addressBuyerTextField: UITextField = {
        $0.textAlignment = .left
        $0.placeholder = "Введите адрес доставки"
        return $0
    }(UITextField())
    
    private let deliveryByCourierLabel: UILabel = {
        $0.textColor = .systemPurple
        $0.textAlignment = .left
        $0.text = "Доставка курьером:"
        return $0
    }(UILabel())
    
    private lazy var deliveryByCourierSwitch: UISwitch = {
        $0.onTintColor = .systemPurple
        $0.addTarget(self, action: #selector(deliveryByCourierStatusChangeAction(target:)), for: .touchUpInside)
        return $0
    }(UISwitch())
    
    private lazy var makePaymentButton: UIButton = {
        $0.setTitle("Оплатить", for: .normal)
        $0.backgroundColor = .systemPurple
        $0.addTarget(self, action: #selector(goToPaymentVCAction(target:)), for: .touchUpInside)
        return $0
    }(UIButton())
    
    var buyerData = BuyerData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc func deliveryByCourierStatusChangeAction(target: UISwitch) {
        guard target.isEqual(deliveryByCourierSwitch) else { return }
        buyerData.deliveryByCourier = target.isOn
    }
    
    @objc func backToProductsVCAction(target: UIButton) {
        guard target.isEqual(backButton) else { return }
        let productsVC = ProductsViewController()
        productsVC.modalPresentationStyle = .fullScreen
        present(productsVC, animated: true)
    }
    
    @objc func goToPaymentVCAction(target: UIButton) {
        guard target.isEqual(makePaymentButton) else { return }
        guard
            let fioBuyer = fioBuyerTextField.text,
            let addressBuyer = addressBuyerTextField.text,
            fioBuyer.isEmpty || addressBuyer.isEmpty
        else {
            let paymentVC = PaymentViewController()
            paymentVC.modalPresentationStyle = .fullScreen
            guard let safeFioBuyer = fioBuyerTextField.text,
                  let safeAddressBuyer = addressBuyerTextField.text
            else {
                return
            }
            buyerData.fioBuyer = safeFioBuyer
            buyerData.addressBuyer = safeAddressBuyer
            buyerData.birthdayBuyer = setBirthdayBuyerPickerView.date.formatted(date: .long, time: .omitted)
            paymentVC.buyerData = buyerData
            present(paymentVC, animated: true)
            return
        }
        let alertController = UIAlertController(
            title: "Дружок заполни все поля пожалуйста 😊",
            message: "",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "Ща сделаю 😉", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    @objc func dismissKeyboardAction() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    private func setUI() {
        fioBuyerTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardAction))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(dataForDeliveryLabel)
        view.addSubview(fioBuyerLabel)
        view.addSubview(fioBuyerTextField)
        view.addSubview(birthdayBuyerLabel)
        view.addSubview(setBirthdayBuyerPickerView)
        view.addSubview(addressBuyerLabel)
        view.addSubview(addressBuyerTextField)
        view.addSubview(deliveryByCourierLabel)
        view.addSubview(deliveryByCourierSwitch)
        view.addSubview(makePaymentButton)
        
        backButton.frame = CGRect(x: 0, y: 50, width: 100, height: 60)
        dataForDeliveryLabel.frame = CGRect(x: 0, y: 100, width: 400, height: 100)
        fioBuyerLabel.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
        fioBuyerTextField.frame = CGRect(x: 20, y: 250, width: 300, height: 50)
        birthdayBuyerLabel.frame = CGRect(x: 20, y: 300, width: 300, height: 50)
        setBirthdayBuyerPickerView.frame = CGRect(x: 20, y: 350, width: 150, height: 50)
        addressBuyerLabel.frame = CGRect(x: 20, y: 400, width: 300, height: 50)
        addressBuyerTextField.frame = CGRect(x: 20, y: 450, width: 300, height: 50)
        deliveryByCourierLabel.frame = CGRect(x: 20, y: 500, width: 180, height: 32)
        deliveryByCourierSwitch.frame = CGRect(x: 200, y: 500, width: 100, height: 32)
        makePaymentButton.frame = CGRect(x: view.frame.size.width / 2 - 175,
                                          y: view.frame.size.height - 120,
                                          width: 350,
                                          height: 50)
    }
}
