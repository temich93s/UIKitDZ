//
//  CompositionViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 29.09.2022.
//

import UIKit

/// CompositionViewController: экран с БЖУ и составом пиццы
final class CompositionViewController: UIViewController {
    
    private lazy var compositionPizzaLabel: UILabel = {
        $0.font = UIFont(name: "Verdana", size: 25)
        $0.text = """
            Пицца "\(currentPizza.namePizza)"
            
            Состав:
            \(currentPizza.compositionPizza)
            
            БЖУ:
            Белки: \(currentPizza.kkalPizza.proteins) гр.
            Жиры: \(currentPizza.kkalPizza.fats) гр.
            Углеводы: \(currentPizza.kkalPizza.carbohydrates) гр.
            Ккал: \(currentPizza.kkalPizza.kkal) 
            """
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .black
        return $0
    }(UILabel())
    
    var currentPizza = DataPizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .orange
        view.addSubview(compositionPizzaLabel)
        
        compositionPizzaLabel.frame = CGRect(x: 0, y: 0, width: 350, height: 500)
        compositionPizzaLabel.center = view.center
    }
}
