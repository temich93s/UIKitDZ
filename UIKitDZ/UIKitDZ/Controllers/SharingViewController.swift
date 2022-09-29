//
//  SharingViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 27.09.2022.
//

import UIKit

/// SharingViewController - экран где мы расшариваем элементы из приложения
class SharingViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var chosenPhotoSegmentedControl: UISegmentedControl!
    @IBOutlet weak var itemSharingPicker: UIPickerView!
    @IBOutlet weak var shareMessageTextField: UITextField!
    @IBOutlet weak var shareMessageButton: UIButton!
    @IBOutlet weak var shareMelodyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDataSourse()
        setUI()
    }
    
    @objc func dismissKeyboardAction() {
        view.endEditing(true)
    }
    
    func setDelegateAndDataSourse() {
        itemSharingPicker.delegate = self
        itemSharingPicker.dataSource = self
        shareMessageTextField.delegate = self
    }
    
    func startItemSharing(item: Any?) {
        guard let saveItem = item else { return }
        let safeActivityVC = UIActivityViewController(
            activityItems: [saveItem],
            applicationActivities: nil
        )
        present(safeActivityVC, animated: true, completion: nil)
    }
    
    func setUI() {
        photoImageView.image = UIImage(named: "Image1")
        photoImageView.layer.cornerRadius = 20
        chosenPhotoSegmentedControl.selectedSegmentIndex = 0
        shareMessageButton.layer.cornerRadius = shareMessageButton.frame.height / 2
        shareMelodyButton.layer.cornerRadius = shareMessageButton.frame.height / 2
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardAction))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func chosenPhotoChangeAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            photoImageView.image = UIImage(named: "Image1")
        case 1:
            photoImageView.image = UIImage(named: "Image2")
        case 2:
            photoImageView.image = UIImage(named: "Image3")
        default:
            break
        }
    }
    
    @IBAction func shareMessageButtonAction(_ sender: UIButton) {
        guard
            let safeMessage = shareMessageTextField.text,
            !safeMessage.isEmpty
        else {
            let alertController = UIAlertController(title: "Введите текст", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "ок", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
            return
        }
        startItemSharing(item: safeMessage)
    }
    
    @IBAction func shareMelodyButtonAction(_ sender: UIButton) {
        guard let url = Bundle.main.url(forResource: "Lightwire - Sunset", withExtension: "mp3") else { return }
        startItemSharing(item: url)
    }
}

/// SharingViewController: UIPickerViewDelegate - устанавливаем ячейку для UIPickerView и действие когда ячейка выбрана
extension SharingViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        switch row {
        case 0:
            return createPickerLabel(name: "1 Variant")
        case 1:
            return createPickerLabel(name: "2 Variant")
        case 2:
            return createPickerLabel(name: "Share")
        default:
            return createPickerLabel(name: "")
        }
    }
    
    func createPickerLabel(name: String) -> UILabel {
        let pickerLabel: UILabel = {
            $0.bounds = CGRect(x: 0, y: 0, width: 200, height: 40)
            $0.textColor = .brown
            $0.text = name
            $0.font = UIFont(name: "Papyrus", size: 35)
            $0.textAlignment = .center
            return $0
        }(UILabel())
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 2:
            startItemSharing(item: photoImageView.image)
        default:
            break
        }
    }

}

/// SharingViewController: UIPickerViewDelegate - устанавливаем количество компонентов и строк для UIPickerView
extension SharingViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
    
}

/// SharingViewController: UIPickerViewDelegate - скрываем клавиатуру при нажатии return
extension SharingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shareMessageTextField.resignFirstResponder()
        return true
    }
}
