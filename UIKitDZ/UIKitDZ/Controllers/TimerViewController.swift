//
//  TimerViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 30.09.2022.
//

import UIKit

/// Экран таймера
class TimerViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var timePickerView: UIPickerView!
    
    private var currentSecondsTimer = 0
    private var currentMinutesTimer = 0
    private var currentHoursTimer = 0
    private var timer = Timer()
    private var finishTimerTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDataSourceAndDelegate()
    }
    
    func setDataSourceAndDelegate() {
        timePickerView.dataSource = self
        timePickerView.delegate = self
    }
    
    func setUI() {
        startButton.layer.cornerRadius = startButton.bounds.height / 2
        startButton.layer.borderWidth = 2
        startButton.layer.borderColor = CGColor(red: 0, green: 255, blue: 0, alpha: 0.5)
        cancelButton.layer.cornerRadius = cancelButton.bounds.height / 2
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        timePickerView.tintColor = .white
        
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        guard !(currentHoursTimer == 0 && currentMinutesTimer == 0 && currentSecondsTimer == 0)
        else {
            return
        }
        finishTimerTime = Int(Date.timeIntervalSinceReferenceDate) +
            (currentHoursTimer * 60 * 60) +
            (currentMinutesTimer * 60) +
            currentSecondsTimer
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(fireTimer),
            userInfo: nil,
            repeats: true)
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        timePickerView.isUserInteractionEnabled = true
        timer.invalidate()
        currentSecondsTimer = 0
        currentMinutesTimer = 0
        currentHoursTimer = 0
        for number in 0..<timePickerView.numberOfComponents {
            timePickerView.selectRow(0, inComponent: number, animated: true)
        }
    }
    
    @objc private func fireTimer() {
        timePickerView.isUserInteractionEnabled = false
        if (currentSecondsTimer == 0) && (currentMinutesTimer == 0) && (currentHoursTimer > -1) {
            currentHoursTimer -= 1
            currentMinutesTimer = 59
            currentSecondsTimer = 59
        } else if (currentSecondsTimer == 0) && (currentMinutesTimer > -1) {
            currentMinutesTimer -= 1
            currentSecondsTimer = 59
        } else if currentSecondsTimer > 0 {
            currentSecondsTimer -= 1
        }
        print(currentHoursTimer, currentMinutesTimer, currentSecondsTimer)
        timePickerView.selectRow(currentSecondsTimer, inComponent: 2, animated: true)
        timePickerView.selectRow(currentMinutesTimer, inComponent: 1, animated: true)
        timePickerView.selectRow(currentHoursTimer, inComponent: 0, animated: true)
        print("\(finishTimerTime - Int(Date.timeIntervalSinceReferenceDate))")
        guard
            Int(Date.timeIntervalSinceReferenceDate) < finishTimerTime
        else {
            timePickerView.isUserInteractionEnabled = true
            timer.invalidate()
            return
        }
    }
    
}

/// Устанавливаем количество секций и строк
extension TimerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(component)
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        case 2:
            return 60
        default:
            return 0
        }
    }
}

/// Устанавливаем содержимое pickerView и обрабатываем события выбранной строки
extension TimerViewController: UIPickerViewDelegate {
    func pickerView(
        _ pickerView: UIPickerView,
        attributedTitleForRow row: Int, forComponent component: Int
    ) -> NSAttributedString? {
        switch component {
        case 0:
            return NSAttributedString(string: "\(row) ч", attributes: [.foregroundColor: UIColor.white])
        case 1:
            return NSAttributedString(string: "\(row) мин", attributes: [.foregroundColor: UIColor.white])
        case 2:
            return NSAttributedString(string: "\(row) с", attributes: [.foregroundColor: UIColor.white])
        default:
            return NSAttributedString(string: "", attributes: [.foregroundColor: UIColor.white])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            currentHoursTimer = row
        case 1:
            currentMinutesTimer = row
        case 2:
            currentSecondsTimer = row
        default:
            return
        }
    }
}
