//
//  ConspectViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 28.09.2022.
//
/*
import UIKit

/// ConspectViewController: конспект урока 9 и 10
class ConspectViewController: UIViewController {

    /// стек - это упорядаченная коллекция элементов? где доавление нового или удаление существующего элемента всегда происходит только на одном из концов (вершина-основание)
    /// Navigation требует для себя первый контроллер (rootVC)
    /// push - когда мы делаем push VC то мы кладем сверху на текущий VC еще один VC
    /// pop - мы убираем/удаляем самый верхний VC
    
    let displaySecondButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstVC"
        
        displaySecondButton.setTitle("SecondVC", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.center = view.center
        displaySecondButton.addTarget(
            self,
            action: #selector(performDisplaySecondVC(parametrSender:)),
            for: .touchUpInside
        )
        view.addSubview(displaySecondButton)
        
        createImageTitleView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .camera,
            target: self,
            action: #selector(performAdd(param:))
        )
        
        let simpleSwitch = UISwitch()
        simpleSwitch.isOn = true
        simpleSwitch.addTarget(self, action: #selector(switchIsChange(param:)), for: .valueChanged)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: simpleSwitch)
    }
    
    @objc func switchIsChange(param: UISwitch) {
        if param.isOn {
            print("вкл")
        } else {
            print("выкл")
        }
    }
    
    @objc func performAdd(param: UIBarButtonItem) {
        print("add click")
    }
    
    // задаем картинку в качестве title у UINavigationController
    fileprivate func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Image")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    @objc func performDisplaySecondVC(parametrSender: Any) {
        let secondVC = SecondViewController()
        // отображаем secondVC поверх текущего VC (push)
        navigationController?.pushViewController(secondVC, animated: false)
    }
    
}
 */
