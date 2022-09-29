//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 28.09.2022.
//

import UIKit

/// PizzaViewController: экран со списком пицц
final class PizzaViewController: UIViewController {
    
    var pizzaArray: [DataPizza] = [
        DataPizza(namePizza: "Маргарита",
                  nameImagePizza: "margo",
                  ingredientsPizza: [("Сыр", true), ("Ветчина", true), ("Грибы", true), ("Маслины", true)],
                  compositionPizza: "Моцарелла, томаты, итальянские травы, томатный соус, ветчина, грибы, маслины",
                  kkalPizza: (proteins: "9", fats: "7", carbohydrates: "28,2", kkal: "217,5")),
        DataPizza(namePizza: "Домашняя",
                  nameImagePizza: "home",
                  ingredientsPizza: [("Сыр", true), ("Ветчина", true), ("Пеперони", true), ("Соленые огурцы", true)],
                  compositionPizza: "Пепперони, ветчина, маринованные огурчики, томаты, моцарелла, томатный соус",
                  kkalPizza: (proteins: "7,3", fats: "5,4", carbohydrates: "28,2", kkal: "195,9")),
        DataPizza(namePizza: "Сырный цыпленок",
                  nameImagePizza: "cheeseChick",
                  ingredientsPizza: [("Курица", true), ("Чеснок", true), ("Томаты", true)],
                  compositionPizza: "Цыпленок, моцарелла, чеддер, пармезан, сырный соус, томаты, соус альфредо, чеснок",
                  kkalPizza: (proteins: "11", fats: "8,9", carbohydrates: "28,3", kkal: "243,9")),
        DataPizza(namePizza: "Гавайская",
                  nameImagePizza: "hawaii",
                  ingredientsPizza: [("Ветчина", true), ("Ананасы", true)],
                  compositionPizza: "Ветчина, ананасы, моцарелла, томатный соус",
                  kkalPizza: (proteins: "8,1", fats: "5,7", carbohydrates: "30", kkal: "209,2"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        title = "Pizza"
        view.backgroundColor = .white
        guard let chevronBackwardImage = UIImage(systemName: "chevron.backward") else { return }
        let backToFoodVCAction = UIAction { _ in
            self.navigationController?.popViewController(animated: false)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "rer",
                                                           image: chevronBackwardImage,
                                                           primaryAction: backToFoodVCAction,
                                                           menu: nil)
        for indexPizza in 0..<pizzaArray.count {
            createPizzaLine(
                image: pizzaArray[indexPizza].nameImagePizza,
                name: pizzaArray[indexPizza].namePizza,
                numberLine: indexPizza)
        }
    }
    
    private func createPizzaLine(image: String, name: String, numberLine: Int) {
        let pizzaImageView: UIImageView = {
            $0.contentMode = .scaleAspectFill
            $0.image = UIImage(named: image)
            return $0
        }(UIImageView())
        
        let pizzaNameLabel: UILabel = {
            $0.text = name
            $0.textAlignment = .center
            $0.font = UIFont(name: "Verdana", size: 20)
            return $0
        }(UILabel())
        
        lazy var pizzaAddButton: UIButton = {
            $0.setTitle("+", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .orange
            $0.titleLabel?.font = UIFont(name: "Verdana", size: 20)
            $0.layer.cornerRadius = 10
            $0.tag = numberLine
            $0.addTarget(self, action: #selector(goToIngridientsPizzaVCAction(target:)), for: .touchUpInside)
            return $0
        }(UIButton())
        
        view.addSubview(pizzaImageView)
        view.addSubview(pizzaNameLabel)
        view.addSubview(pizzaAddButton)
        pizzaImageView.frame = CGRect(x: 20, y: (numberLine * 120) + 150, width: 100, height: 100)
        pizzaNameLabel.frame = CGRect(x: 130, y: (numberLine * 120) + 150, width: 200, height: 100)
        pizzaAddButton.frame = CGRect(x: 350, y: (numberLine * 120) + 175, width: 50, height: 50)
    }
    
    @objc private func goToIngridientsPizzaVCAction(target: UIButton) {
        let ingredientsPizzaViewController = IngredientsPizzaViewController()
        ingredientsPizzaViewController.modalPresentationStyle = .formSheet
        ingredientsPizzaViewController.currentPizza = pizzaArray[target.tag]
        present(ingredientsPizzaViewController, animated: true)
    }
    
}
