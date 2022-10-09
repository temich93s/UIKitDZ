//
//  Conspects.swift
//  UIKitDZ
//
//  Created by 2lup on 05.10.2022.
//

//  Видеоурок 15 - UIButton

/*
import UIKit

/// ViewController
class ViewController: UIViewController {

    @IBOutlet var myButtons: [UIButton]!

    var myButton = UIButton()
    let normalImage = UIImage(named: "1")
    let highlightedImage = UIImage(named: "2")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in myButtons {
            button.setTitleColor(UIColor.green, for: .normal)
        }
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 100)
        myButton.setTitle("PressMe", for: .normal)
        myButton.setTitle("I`m pressed", for: .highlighted)
        myButton.addTarget(self, action: #selector(buttonIsPressed), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
        myButton.setBackgroundImage(normalImage, for: .normal)
        myButton.setBackgroundImage(highlightedImage, for: .highlighted)
        view.addSubview(myButton)
    }
    
    @objc func buttonIsPressed(sender: UIButton) {
        print("Button is pressed")
    }
    
    @objc func buttonIsTapped(sender: UIButton) {
        print("button Is Tapped")
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        let button = sender as! UIButton
        if button.titleLabel?.text == "Button1" {
            print("Button1")
        } else if button.tag == 3 {
            print("Button3")
        }
        
    }
}
*/
