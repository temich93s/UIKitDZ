//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 28.09.2022.
//
/*
import UIKit

/// SecondViewController - нужен был для видеоурока 9-10
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondVC"
        
        let items = ["up", "down"]
        let segmentController = UISegmentedControl(items: items)
        // Логическое значение, определяющее, отображаются ли сегменты в приемнике в выбранном состоянии
        segmentController.isMomentary = true
        segmentController.addTarget(self, action: #selector(segmentControllTapped(param:)), for: .valueChanged)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: segmentController)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // осуществляем возрат назад (pop) через 3 сек
        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    
    @objc func segmentControllTapped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
    }
    
    @objc func goBack() {
        // Извлекает контроллер верхнего вида из стека навигации и обновляет дисплей.
        // self.navigationController?.popViewController(animated: true)
        
        // текущий массив VC из NavigationController
        var currentControllerArray = navigationController?.viewControllers
        // удаляем последний VC
        currentControllerArray?.removeLast()
        // обновляем массив VC у NavigationController
        if let newController = currentControllerArray {
            navigationController?.viewControllers = newController
        }
    }

}
*/
