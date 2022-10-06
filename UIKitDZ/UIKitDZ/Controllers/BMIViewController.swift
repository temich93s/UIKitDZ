//
//  BMIViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 03.10.2022.
//

import UIKit

/// Экран с расчетом ИМТ человка
final class BMIViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let highDeficitWeight = "У вас: Выраженный дефицит массы"
        static let lowDeficitWeight = "У вас: Недостаточная масса тела"
        static let normalWeight = "У вас: Норма"
        static let excessWeight = "У вас: Избыточная масса тела"
        static let obesityFirstStage = "У вас: Ожирение первой степени"
        static let obesitySecondStage = "У вас: Ожирение второй степени"
        static let obesityThirdStage = "У вас: Ожирение третьей степени"
        static let guessText = "Вы угадали 🙂"
        static let notGuessText = "Вы не угадали ☹️"
        static let zeroFloat: Float = 0.0
        static let countComponentPickerView = 1
        static let countRowPickerView = 100
        static let offsetNumberForWeight = 20
        static let topLineShortage: Float = 18.5
        static let topLineNormally: Float = 25
        static let kgText = "кг"
        static let smText = "см"
        static let yourHightText = "Ваш рост:"
        static let topLineHighDeficitWeight: Float = 16.5
        static let topLineLowDeficitWeight: Float = 18.5
        static let topLineNormalWeight: Float = 25
        static let topLineExcessWeight: Float = 30
        static let topLineObesityFirstStage: Float = 35
        static let topLineObesitySecondStage: Float = 40
    }
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var predictionBMISegmented: UISegmentedControl!
    @IBOutlet private weak var heightPersonLabel: UILabel!
    @IBOutlet private weak var heightPersonSlider: UISlider!
    @IBOutlet private weak var weightPersonLabel: UILabel!
    @IBOutlet private weak var weightPersonPickerView: UIPickerView!
    @IBOutlet private weak var resultBMILabel: UILabel!
    
    // MARK: - Private Properties
    
    private var personBMI = PersonBMI()
    private var predictionsBMI: [PersonBMI.Prediction] = [.shortage, .normally, .surplus]
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDataSource()
    }
    
    // MARK: - IBAction
    
    @IBAction func predictionBMIAction(_ sender: UISegmentedControl) {
        personBMI.personPrediction = predictionsBMI[predictionBMISegmented.selectedSegmentIndex]
    }
    
    @IBAction func heightPersonAction(_ sender: UISlider) {
        let decimalNumber = round(heightPersonSlider.value)
        heightPersonLabel.text = "\(Constants.yourHightText) \(Int(decimalNumber)) \(Constants.smText)"
        personBMI.personHeight = decimalNumber
    }
    
    @IBAction func calculateBMIAction(_ sender: UIButton) {
        let result = personBMI.personWeight / pow((personBMI.personHeight / 100), 2)
        setTextForResult(result: result)
        print(result)
    }
    
    // MARK: - Private Methods
    
    private func setDelegateAndDataSource() {
        weightPersonPickerView.delegate = self
        weightPersonPickerView.dataSource = self
    }
    
    private func setTextForResult(result: Float) {
        guard
            personBMI.personHeight != Constants.zeroFloat && personBMI.personWeight != Constants.zeroFloat
        else {
            return
        }
        switch result {
        case Constants.zeroFloat..<Constants.topLineHighDeficitWeight:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.highDeficitWeight)
                """
            resultBMILabel.backgroundColor = .cyan
            
        case Constants.topLineHighDeficitWeight..<Constants.topLineLowDeficitWeight:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.lowDeficitWeight)
                """
            resultBMILabel.backgroundColor = .cyan
        case Constants.topLineLowDeficitWeight..<Constants.topLineNormalWeight:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.normalWeight)
                """
            resultBMILabel.backgroundColor = .green
        case Constants.topLineNormalWeight..<Constants.topLineExcessWeight:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.excessWeight)
                """
            resultBMILabel.backgroundColor = .yellow
        case Constants.topLineExcessWeight..<Constants.topLineObesityFirstStage:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.obesityFirstStage)
                """
            resultBMILabel.backgroundColor = .orange
        case Constants.topLineObesityFirstStage..<Constants.topLineObesitySecondStage:
            resultBMILabel.text = """
                \(checkPrediction(result: result))
                \(Constants.obesitySecondStage)
                """
            resultBMILabel.backgroundColor = .red
        case Constants.topLineObesitySecondStage...:
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
        switch personBMI.personPrediction {
        case .shortage:
            guard
                Constants.zeroFloat..<Constants.topLineShortage ~= result
            else {
                return "\(Constants.notGuessText)"
            }
            return "\(Constants.guessText)"
        case .normally:
            guard
                Constants.topLineShortage..<Constants.topLineNormally ~= result
            else {
                return "\(Constants.notGuessText)"
            }
            return "\(Constants.guessText)"
        case .surplus:
            guard
                Constants.topLineNormally... ~= result
            else {
                return "\(Constants.notGuessText)"
            }
            return "\(Constants.guessText)"
        }
    }
    
}

// MARK: - UIPickerViewDataSource

extension BMIViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        Constants.countComponentPickerView
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constants.countRowPickerView
    }
    
}

// MARK: - UIPickerViewDelegate

extension BMIViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Int(row + Constants.offsetNumberForWeight)) \(Constants.kgText)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        personBMI.personWeight = Float(row + Constants.offsetNumberForWeight)
    }
}
