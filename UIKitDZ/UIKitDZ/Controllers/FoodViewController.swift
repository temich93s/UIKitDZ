//
//  FoodViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 28.09.2022.
//

import UIKit

/// FoodViewController: Экран со списком еды
class FoodViewController: UIViewController {

    var dataFeedback: [String] = []
    
    private lazy var pizzaButton: UIButton = {
        $0.setTitle("Пицца", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.addTarget(self, action: #selector(goToPizzaVCAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private var sushiButton: UIButton = {
        $0.setTitle("Суши", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
        return $0
    }(UIButton())
    
    private lazy var feedbackButton: UIButton = {
        $0.setTitle("Обратная связь", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        $0.backgroundColor = .systemCyan
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(feedbackAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc private func goToPizzaVCAction() {
        let pizzaViewController = PizzaViewController()
        navigationController?.pushViewController(pizzaViewController, animated: false)
    }
    
    @objc private func feedbackAction() {
        let alertController = UIAlertController(
            title: "Обратная связь",
            message: "Расскажите что понравилось, что не понравилось",
            preferredStyle: .alert)
        var alertTextField = UITextField()
        let alertOkAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        let alertSendAction = UIAlertAction(title: "Отправить", style: .default) { _ in
            guard let safeText = alertTextField.text else { return }
            self.dataFeedback.append(safeText)
        }
        alertController.addTextField { alertTF in
            alertTextField = alertTF
        }
        alertController.addAction(alertOkAction)
        alertController.addAction(alertSendAction)
        
        present(alertController, animated: true)
    }
    
    private func setUI() {
        title = "Food"
        view.backgroundColor = .white
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        feedbackButton.layer.cornerRadius = 10
        
        view.addSubview(pizzaButton)
        view.addSubview(sushiButton)
        view.addSubview(feedbackButton)
        
        pizzaButton.frame = CGRect(x: 0, y: 150, width: 350, height: 110)
        pizzaButton.center.x = view.center.x
        sushiButton.frame = CGRect(x: 0, y: 300, width: 350, height: 110)
        sushiButton.center.x = view.center.x
        feedbackButton.frame = CGRect(x: 0, y: view.bounds.height - 150, width: 350, height: 50)
        feedbackButton.center.x = view.center.x
        
    }
    
}
