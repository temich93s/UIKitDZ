//
//  BMIViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 03.10.2022.
//

import UIKit

/// Экран с расчетом ИМТ человка
final class BMIViewController: UIViewController {

    private enum Constants {
        static let highDeficitWeight = "У вас: Выраженный дефицит массы"
        static let lowDeficitWeight = "У вас: Недостаточная масса тела"
        static let normalWeight = "У вас: Норма"
        static let excessWeight = "У вас: Избыточная масса тела"
        static let obesityOneStage = "У вас: Ожирение первой степени"
        static let obesitySecondStage = "У вас: Ожирение второй степени"
        static let obesityThirdStage = "У вас: Ожирение третьей степени"
        static let guessText = "Вы угадали 🙂"
        static let notGuessText = "Вы не угадали ☹️"
        static let zeroFloat: Float = 0.0
        static let countComponentPickerView = 1
        static let countRowPickerView = 100
        static let offsetNumberForWeight = 20
    }
    
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
            personBMIData.personHeight != Constants.zeroFloat && personBMIData.personWeight != Constants.zeroFloat
        else {
            return
        }
        switch result {
        case 0..<16.5:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.highDeficitWeight)
                """
            resultBMILabel.backgroundColor = .cyan
            
        case 16.5..<18.5:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.lowDeficitWeight)
                """
            resultBMILabel.backgroundColor = .cyan
        case 18.5..<25:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.normalWeight)
                """
            resultBMILabel.backgroundColor = .green
        case 25..<30:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.excessWeight)
                """
            resultBMILabel.backgroundColor = .yellow
        case 30..<35:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.obesityOneStage)
                """
            resultBMILabel.backgroundColor = .orange
        case 35..<40:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.obesitySecondStage)
                """
            resultBMILabel.backgroundColor = .red
        case 40...:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.obesityThirdStage)
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
                return "\(Constants.notGuessText)"
            }
            return "\(Constants.guessText)"
        case PersonBMIData.Prediction.normally:
            guard
                18.5..<25 ~= result
            else {
                return "\(Constants.notGuessText)"
            }
            return "\(Constants.guessText)"
        case PersonBMIData.Prediction.surplus:
            guard
                25... ~= result
            else {
                return "\(Constants.notGuessText)"
            }
            return "\(Constants.guessText)"
        }
    }
    
}

/// Подписываемся для установления данных в UIPickerView
extension BMIViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        Constants.countComponentPickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constants.countRowPickerView
    }
    
}

/// Подписываемся на обработку событий UIPickerView
extension BMIViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Int(row + Constants.offsetNumberForWeight)) кг"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        personBMIData.personWeight = Float(row + Constants.offsetNumberForWeight)
    }
}
