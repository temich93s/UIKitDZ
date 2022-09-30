//
//  IngredientsPizzaViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 28.09.2022.
//

import UIKit

/// Протокол для возможности очистки экранов с памяти и возврата на корневой VC
protocol PopToRootDelegate: AnyObject {
    func goToBack()
}

/// Экран с выбором ингридиентов для пиццы
final class IngredientsPizzaViewController: UIViewController {
    
    private lazy var namePizzaLabel: UILabel = {
        $0.text = currentPizza.pizzaName
        $0.font = UIFont(name: "Verdana", size: 30)
        $0.textAlignment = .center
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var pizzaImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: currentPizza.nameImagePizza)
        return $0
    }(UIImageView())
    
    private lazy var compositionButton: UIButton = {
        $0.setTitle("Состав БЖУ", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        $0.backgroundColor = .orange
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(compositionButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var choseButton: UIButton = {
        $0.setTitle("Выбрать", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        $0.backgroundColor = .orange
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(choseButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    var currentPizza = DataPizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        for pizzaIndex in 0..<currentPizza.ingredientsPizza.count {
            createIngredientLine(
                nameIngredient: currentPizza.ingredientsPizza[pizzaIndex].nameIngredient,
                availabilityIngredient: currentPizza.ingredientsPizza[pizzaIndex].availabilityIngredient,
                numberLine: pizzaIndex)
        }
        
        view.addSubview(namePizzaLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(choseButton)
        view.addSubview(compositionButton)
        
        namePizzaLabel.frame = CGRect(x: 0, y: 20, width: 350, height: 50)
        namePizzaLabel.center.x = view.center.x
        pizzaImageView.frame = CGRect(x: 0, y: 100, width: 300, height: 300)
        pizzaImageView.center.x = view.center.x
        choseButton.frame = CGRect(x: view.bounds.width / 2 - 150, y: view.bounds.height - 200, width: 300, height: 40)
        compositionButton.frame = CGRect(
            x: view.bounds.width / 2 - 150,
            y: view.bounds.height - 250,
            width: 300,
            height: 40)
    }
    
    private func createIngredientLine(nameIngredient: String, availabilityIngredient: Bool, numberLine: Int) {
        let nameIngredientLabel: UILabel = {
            $0.text = nameIngredient
            $0.textAlignment = .left
            $0.font = UIFont(name: "Verdana", size: 20)
            $0.textColor = .black
            return $0
        }(UILabel())
        
        lazy var availabilityIngredientSwitch: UISwitch = {
            $0.setOn(availabilityIngredient, animated: false)
            $0.tag = numberLine
            $0.addTarget(self, action: #selector(changeAvailabilityIngredientAction(target:)), for: .valueChanged)
            return $0
        }(UISwitch())
        
        view.addSubview(nameIngredientLabel)
        view.addSubview(availabilityIngredientSwitch)
        nameIngredientLabel.frame = CGRect(x: 20, y: (numberLine * 40) + 450, width: 250, height: 32)
        availabilityIngredientSwitch.frame = CGRect(x: 300, y: (numberLine * 40) + 450, width: 50, height: 32)
    }
    
    @objc private func choseButtonAction() {
        let billViewController = BillViewController()
        // через делегаты
        billViewController.delegate = self
        // через замыкание
        billViewController.goToBackTwoHandler = goToBackClosure
        billViewController.currentPizza = currentPizza
        let navigationControllerTwo = UINavigationController(rootViewController: billViewController)
        navigationControllerTwo.modalPresentationStyle = .fullScreen
        present(navigationControllerTwo, animated: true)
    }
    
    @objc private func changeAvailabilityIngredientAction(target: UISwitch) {
        currentPizza.ingredientsPizza[target.tag].availabilityIngredient = target.isOn
        print(currentPizza.ingredientsPizza)
    }
    
    @objc private func compositionButtonAction() {
        let compositionViewController = CompositionViewController()
        compositionViewController.currentPizza = currentPizza
        compositionViewController.modalPresentationStyle = .pageSheet
        present(compositionViewController, animated: true)
    }
    
    // через замыкание
    lazy var goToBackClosure = {
        if let billViewController = self.presentingViewController as? UINavigationController {
            self.view.isHidden = true
            self.dismiss(animated: false)
            billViewController.popToRootViewController(animated: false)
        }
    }
}

/// Подписываемся для возможности очистки экранов с памяти и возврата на корневой VC
extension IngredientsPizzaViewController: PopToRootDelegate {
    func goToBack() {
        if let billViewController = self.presentingViewController as? UINavigationController {
            view.isHidden = true
            dismiss(animated: false)
            billViewController.popToRootViewController(animated: false)
        }
    }
}
