//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// ViewController
/// UITextViewDelegate - тоже самое что и у TextField
class Conspect: UIViewController, UITextViewDelegate {
    
    var myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextView()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTextView),
            name: UIResponder.keyboardDidShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTextView),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }

    func createTextView() {
        myTextView = UITextView(frame:
                                    CGRect(
                                        x: 20,
                                        y: 100,
                                        width: view.bounds.width - 40,
                                        height: view.bounds.height / 2
                                    )
        )
        myTextView.text = "some text"
        // contentInset - Настраиваемое расстояние, на которое вставляется представление содержимого от безопасной области или краев scrollview.
        myTextView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        myTextView.font = UIFont.systemFont(ofSize: 24)
        myTextView.backgroundColor = .secondarySystemBackground
        view.addSubview(myTextView)
    }
    
    // скрываем клавиатуру при нажатии на view (именно саму view у ViewController)
    override func touchesBegan(_ touchesSet: Set<UITouch>, with event: UIEvent?) {
        myTextView.resignFirstResponder()
    }
    
    @objc func updateTextView(param: Notification) {
        // userInfo - Хранилище для значений или объектов, связанных с этим уведомлением.
        let userInfo = param.userInfo
        // keyboardFrameEndUserInfoKey - Информационная клавиша пользователя для получения кадра клавиатуры в конце анимации.
        // NSValue - Простой контейнер для одного элемента данных C или Objective-C.
        // cgRectValue - Возвращает представление прямоугольной структуры CoreGraphics значения.
        // getKeyboardRect - получили контуры нашей клавиатуры
        if let getKeyboardRect = ((userInfo?[UIResponder.keyboardFrameEndUserInfoKey] ?? "") as? NSValue)?.cgRectValue {
            // convert - Преобразует прямоугольник из системы координат получателя в систему координат другого вида.
            // - rect - Прямоугольник, указанный в локальной системе координат (границах) приемника.
            // - view - Представление, которое является целью операции преобразования. Если view равен нулю, этот метод вместо этого преобразует в базовые координаты окна.
            let keyboardFrame = view.convert(getKeyboardRect, to: view.window)
            if param.name == UIResponder.keyboardWillHideNotification {
                myTextView.contentInset = UIEdgeInsets.zero
            } else {
                // scrollIndicatorInsets - Расстояние, на котором индикаторы прокрутки вставлены от края вида прокрутки.
                myTextView.scrollIndicatorInsets = UIEdgeInsets(
                    top: 0,
                    left: 0,
                    bottom: keyboardFrame.height,
                    right: 0
                )
            }
            // scrollRangeToVisible - Прокручивает текстовое представление до тех пор, пока не станет виден текст в указанном диапазоне.
            // selectedRange - Текущий диапазон выбора текстового представления.
            myTextView.scrollRangeToVisible(myTextView.selectedRange)
        }

    }
    
}
