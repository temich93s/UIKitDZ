//
//  BillViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 28.09.2022.
//

import UIKit

/// BillViewController: Экран оплаты заказа
final class BillViewController: UIViewController {
    
    private lazy var descriptionOrederLabel: UILabel = {
        $0.font = UIFont(name: "Verdana", size: 28)
        $0.text = """
            Ваш заказ:
            1. Пицца "\(currentPizza.namePizza)"
            """
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var paymentInCashLabel: UILabel = {
        $0.text = "Оплата наличными"
        $0.textAlignment = .left
        $0.font = UIFont(name: "Verdana", size: 20)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var paymentInCashSwitch: UISwitch = {
        $0.setOn(false, animated: false)
        $0.tag = 0
        $0.addTarget(self, action: #selector(changePaymentAction(target:)), for: .valueChanged)
        return $0
    }(UISwitch())
    
    private lazy var paymentOnlineLabel: UILabel = {
        $0.text = "Оплата картой"
        $0.textAlignment = .left
        $0.font = UIFont(name: "Verdana", size: 20)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var paymentOnlineSwitch: UISwitch = {
        $0.setOn(false, animated: false)
        $0.tag = 1
        $0.addTarget(self, action: #selector(changePaymentAction(target:)), for: .valueChanged)
        return $0
    }(UISwitch())
    
    private lazy var payButton: UIButton = {
        $0.setTitle("Pay", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        $0.backgroundColor = .black
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    var currentPizza = DataPizza()
    var availableCash = false
    var availableOnline = false
    // через делегаты
    weak var delegate: PopToRootDelegate?
    // через замыкание
    var goToBackTwo: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @objc private func changePaymentAction(target: UISwitch) {
        switch target.tag {
        case 0:
            availableCash.toggle()
        case 1:
            availableOnline.toggle()
        default:
            break
        }
    }
    
    @objc private func payButtonAction() {
        guard !availableCash && !availableOnline else {
            let alertController = UIAlertController(
                title: "Заказ оплачен!",
                message: "Ваш заказ принят в течении 15 минут! \nПриятного аппетита",
                preferredStyle: .alert)
            let actionAlert = UIAlertAction(title: "ОК", style: .default) { _ in
                self.dismiss(animated: false)
                // через замыкание
                self.goToBackTwo?()
                // через протокол
                // self.delegate?.goToBack()
            }
            alertController.addAction(actionAlert)
            present(alertController, animated: true)
            return
        }
        let alertController = UIAlertController(title: "Выберите способ оплаты", message: "", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alertController.addAction(actionAlert)
        present(alertController, animated: true)
    }
    
    private func setUI() {
        title = "Оплата"
        view.backgroundColor = .white
        
        view.addSubview(descriptionOrederLabel)
        view.addSubview(paymentInCashLabel)
        view.addSubview(paymentInCashSwitch)
        view.addSubview(paymentOnlineLabel)
        view.addSubview(paymentOnlineSwitch)
        view.addSubview(payButton)
        
        descriptionOrederLabel.frame = CGRect(x: 20, y: 150, width: 350, height: 400)
        descriptionOrederLabel.center.x = view.center.x
        paymentInCashLabel.frame = CGRect(x: 20, y: view.bounds.height - 250, width: 300, height: 30)
        paymentInCashSwitch.frame = CGRect(x: 350, y: view.bounds.height - 250, width: 50, height: 30)
        paymentOnlineLabel.frame = CGRect(x: 20, y: view.bounds.height - 300, width: 300, height: 30)
        paymentOnlineSwitch.frame = CGRect(x: 350, y: view.bounds.height - 300, width: 50, height: 30)
        payButton.frame = CGRect(x: 0, y: view.bounds.height - 200, width: 300, height: 50)
        payButton.center.x = view.center.x
        
        for (nameIngredientLabel, availabilityIngredientSwitch) in currentPizza.ingredientsPizza {
            guard availabilityIngredientSwitch else { continue }
            descriptionOrederLabel.text?.append("\n- \(nameIngredientLabel)")
        }
    }
    
}
