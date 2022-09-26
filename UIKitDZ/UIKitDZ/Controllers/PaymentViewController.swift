//
//  PaymentViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 26.09.2022.
//

import UIKit

/// PaymentViewController - Экран оплаты покупки
class PaymentViewController: UIViewController {

    var buyerData = BuyerData()
    
    private lazy var backButton: UIButton = {
        $0.setTitle("Отмена", for: .normal)
        $0.setTitleColor(.systemPurple, for: .normal)
        $0.addTarget(self, action: #selector(goToDeliveryVC(target:)), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var dataForCheckLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = $0.font.withSize(35)
        $0.text = "Проверьте данные"
        return $0
    }(UILabel())
    
    private lazy var dataOrderLabel: UILabel = {
        $0.textColor = .systemPurple
        $0.textAlignment = .left
        $0.font = $0.font.withSize(25)
        $0.numberOfLines = 0
        $0.text = """
            ФИО Покупателя:
            - \(buyerData.fioBuyer)
            Адрес доставки:
            - \(buyerData.addressBuyer)
            День рождение покупателя:
            - \(buyerData.birthdayBuyer)
            Доставка курьером:
            - \(buyerData.deliveryByCourier ? "Да" : "Нет")
            Наименование футболки:
            - \(buyerData.chooseProduct.productsName)
            Размер футболки:
            - \(buyerData.chooseProduct.sizeProduct)
            """
        return $0
    }(UILabel())
    
    private let deliveryByCourierLabel: UILabel = {
        $0.textColor = .systemPurple
        $0.textAlignment = .right
        $0.text = "Я все проверил, все верно."
        return $0
    }(UILabel())
    
    private lazy var deliveryByCourierSwitch: UISwitch = {
        $0.onTintColor = .systemPurple
        return $0
    }(UISwitch())
    
    private lazy var makePaymentButton: UIButton = {
        $0.setTitle("Оплатить", for: .normal)
        $0.backgroundColor = .systemPurple
        $0.addTarget(self, action: #selector(makePaymentVC(target:)), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc func makePaymentVC(target: UIButton) {
        guard target.isEqual(makePaymentButton) else { return }
        guard
            deliveryByCourierSwitch.isOn
        else {
            let alertController = UIAlertController(
                title: "Дружок подтверди что все проверил 😊",
                message: "",
                preferredStyle: .alert
            )
            let alertAction = UIAlertAction(title: "Ок 😉", style: .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
            return
        }
        let alertController = UIAlertController(
            title: "Оплата произведена 🥳 \nСпасибо за покупку!",
            message: "",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "Ок 😉", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    @objc func goToDeliveryVC(target: UIButton) {
        guard target == backButton else { return }
        let deliveryVC = DeliveryViewController()
        deliveryVC.modalPresentationStyle = .fullScreen
        present(deliveryVC, animated: true)
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(dataForCheckLabel)
        view.addSubview(dataOrderLabel)
        view.addSubview(deliveryByCourierLabel)
        view.addSubview(deliveryByCourierSwitch)
        view.addSubview(makePaymentButton)
        
        backButton.frame = CGRect(x: 0, y: 50, width: 100, height: 60)
        dataForCheckLabel.frame = CGRect(x: 0, y: 100, width: 400, height: 100)
        dataOrderLabel.frame = CGRect(x: 20, y: 200, width: 400, height: 500)
        deliveryByCourierLabel.frame = CGRect(x: 20,
                                              y: view.frame.size.height - 160,
                                              width: 260, height: 32)
        deliveryByCourierSwitch.frame = CGRect(x: 300,
                                               y: view.frame.size.height - 160,
                                               width: 100,
                                               height: 32)
        makePaymentButton.frame = CGRect(x: view.frame.size.width / 2 - 175,
                                         y: view.frame.size.height - 120,
                                         width: 350,
                                         height: 50)
    }
}
