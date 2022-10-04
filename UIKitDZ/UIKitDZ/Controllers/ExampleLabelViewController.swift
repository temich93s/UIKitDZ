//
//  ExampleLabelViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 01.10.2022.
//

import UIKit

// MARK: - ExampleLabelViewController

/// Экран где можно кастомизировать label
final class ExampleLabelViewController: UIViewController {

    // MARK: - Private Properties
    
    private let exampleLabel: UILabel = {
        $0.text = "TEXT"
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.sizeToFit()
        $0.lineBreakMode = .byWordWrapping
        $0.adjustsFontSizeToFitWidth = true
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.backgroundColor = .secondarySystemBackground
        $0.textColor = .white
        $0.shadowColor = .black
        $0.shadowOffset = CGSize(width: 2, height: 2)
        return $0
    }(UILabel())
    
    private let sizeTextLabel: UILabel = {
        $0.text = "20"
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var sizeTextSlider: UISlider = {
        $0.maximumValue = 50
        $0.minimumValue = 1
        $0.value = 20
        $0.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        return $0
    }(UISlider())
    
    private var colorTextPicker = UIPickerView()
    
    private var numberLineTextPicker = UIPickerView()
    
    private var redColor: CGFloat = 0.0
    private var greenColor: CGFloat = 0.0
    private var blueColor: CGFloat = 0.0
    private var alfaColor: CGFloat = 0.0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegateAndDataSource()
    }
    
    // MARK: - Private Methods

    private func setDelegateAndDataSource() {
        colorTextPicker.delegate = self
        colorTextPicker.dataSource = self
        numberLineTextPicker.delegate = self
        numberLineTextPicker.dataSource = self
    }
    
    private func setUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTextToLabelAction)
        )
        
        view.addSubview(exampleLabel)
        view.addSubview(sizeTextLabel)
        view.addSubview(sizeTextSlider)
        view.addSubview(colorTextPicker)
        view.addSubview(numberLineTextPicker)
        
        exampleLabel.frame = CGRect(x: view.center.x - 150, y: 100, width: 300, height: 300)
        sizeTextLabel.frame = CGRect(x: view.center.x - 150, y: exampleLabel.frame.maxY, width: 300, height: 50)
        sizeTextSlider.frame = CGRect(x: view.center.x - 150, y: sizeTextLabel.frame.maxY, width: 300, height: 50)
        sizeTextSlider.frame = CGRect(x: view.center.x - 150, y: sizeTextLabel.frame.maxY, width: 300, height: 50)
        colorTextPicker.frame = CGRect(x: view.center.x - 175, y: sizeTextSlider.frame.maxY, width: 350, height: 100)
        numberLineTextPicker.frame = CGRect(
            x: view.center.x - 175,
            y: colorTextPicker.frame.maxY,
            width: 350,
            height: 100
        )
        
    }
    
    @objc private func sizeTextAction() {
        sizeTextLabel.text = "\(Int(sizeTextSlider.value))"
        exampleLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(sizeTextSlider.value))
    }
    
    @objc private func addTextToLabelAction() {
        var externalTextField = UITextField()
        let alertController = UIAlertController(title: "Укажите текст", message: "", preferredStyle: .alert)
        alertController.addTextField { alertTextField in
            externalTextField = alertTextField
        }
        let alertAction = UIAlertAction(title: "Далее", style: .default) { _ in
            self.exampleLabel.text = externalTextField.text
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

// MARK: - UIPickerViewDelegate

extension ExampleLabelViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case colorTextPicker:
            switch component {
            case 0:
                return "\(Float(row) / 10) R"
            case 1:
                return "\(Float(row) / 10) G"
            case 2:
                return "\(Float(row) / 10) B"
            case 3:
                return "\(Float(row) / 10) A"
            default:
                return ""
            }
        case numberLineTextPicker:
            return "\(row)"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case colorTextPicker:
            switch component {
            case 0:
                redColor = CGFloat(row) / 10
            case 1:
                greenColor = CGFloat(row) / 10
            case 2:
                blueColor = CGFloat(row) / 10
            case 3:
                alfaColor = CGFloat(row) / 10
            default:
                break
            }
            exampleLabel.textColor = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: alfaColor)
        case numberLineTextPicker:
            exampleLabel.numberOfLines = row
        default:
            break
        }
    }
}

// MARK: - UIPickerViewDataSource

extension ExampleLabelViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case colorTextPicker:
            return 4
        case numberLineTextPicker:
            return 1
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case colorTextPicker:
            return 11
        case numberLineTextPicker:
            return 10
        default:
            return 0
        }
    }
    
}
