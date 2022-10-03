//
//  BMIViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 03.10.2022.
//

import UIKit

/// Экран с расчетом ИМТ человка
class BMIViewController: UIViewController {

    @IBOutlet weak var predictionBMISegmented: UISegmentedControl!
    @IBOutlet weak var heightPersonLabel: UILabel!
    @IBOutlet weak var heightPersonSlider: UISlider!
    @IBOutlet weak var weightPersonLabel: UILabel!
    @IBOutlet weak var weightPersonPickerView: UIPickerView!
    @IBOutlet weak var resultBMILabel: UILabel!
    
    private var personBMIData = PersonBMIData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDataSource()
    }
    
    @IBAction func predictionBMIAction(_ sender: UISegmentedControl) {
        switch predictionBMISegmented.selectedSegmentIndex {
        case 0:
            personBMIData.personPrediction = .shortage
        case 1:
            personBMIData.personPrediction = .normally
        case 2:
            personBMIData.personPrediction = .surplus
        default:
            break
        }
    }
    
    @IBAction func heightPersonAction(_ sender: UISlider) {
        let decimalNumber = round(heightPersonSlider.value)
        heightPersonLabel.text = "Ваш рост: \(Int(decimalNumber)) см"
        personBMIData.personHeight = decimalNumber
    }
    
    @IBAction func calculateBMIAction(_ sender: UIButton) {
        let result = personBMIData.personWeight / pow((personBMIData.personHeight / 100), 2)
        setTextForResult(result: result)
        print(result)
    }
    
    private func setDelegateAndDataSource() {
        weightPersonPickerView.delegate = self
        weightPersonPickerView.dataSource = self
    }
    
    private func setTextForResult(result: Float) {
        guard
            personBMIData.personHeight != 0.0 && personBMIData.personWeight != 0.0
        else {
            return
        }
        switch result {
        case 0..<16.5:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                У вас: Выраженный дефицит массы
                """
            resultBMILabel.backgroundColor = .cyan
            
        case 16.5..<18.5:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                У вас: Недостаточная масса тела
                """
            resultBMILabel.backgroundColor = .cyan
        case 18.5..<25:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                У вас: Норма
                """
            resultBMILabel.backgroundColor = .green
        case 25..<30:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                У вас: Избыточная масса тела
                """
            resultBMILabel.backgroundColor = .yellow
        case 30..<35:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                У вас: Ожирение первой степени
                """
            resultBMILabel.backgroundColor = .orange
        case 35..<40:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                У вас: Ожирение второй степени
                """
            resultBMILabel.backgroundColor = .red
        case 40...:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                У вас: Ожирение третьей степени
                """
            resultBMILabel.backgroundColor = .red
        default:
            break
        }
    }
    
    private func checkPrediction(result: Float) -> String {
        switch personBMIData.personPrediction {
        case .shortage:
            guard
                0..<18.5 ~= result
            else {
                return "Вы не угадали ☹️"
            }
            return "Вы угадали 🙂"
        case PersonBMIData.Prediction.normally:
            guard
                18.5..<25 ~= result
            else {
                return "Вы не угадали ☹️"
            }
            return "Вы угадали 🙂"
        case PersonBMIData.Prediction.surplus:
            guard
                25... ~= result
            else {
                return "Вы не угадали ☹️"
            }
            return "Вы угадали 🙂"
        }
    }
    
}

/// Подписываемся для установления данных в UIPickerView
extension BMIViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        100
    }
    
}

/// Подписываемся на обработку событий UIPickerView
extension BMIViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Int(row + 20)) кг"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        personBMIData.personWeight = Float(row + 20)
    }
}
