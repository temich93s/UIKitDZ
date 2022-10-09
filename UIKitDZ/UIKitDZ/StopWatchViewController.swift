//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// Экран с секундомером
final class StopWatchViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let initialTime = "00:00:00"
        static let timeFormat = "%02d:%02d:%02d"
        static let wordStart = "Старт"
        static let wordContinue = "Продолжить"
        static let wordPause = "Пауза"
        static let numberZero = 0
        static let numberOne = 1
        static let numberTwentyThree = 23
        static let numberFiftyNine = 59
        static let timeInterval = 1.0
        static let numberThree: CGFloat = 3
    }
    
    // MARK: - Private IBOutlet
    
    @IBOutlet private weak var currentTimeLabel: UILabel!
    @IBOutlet private weak var startPauseButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: - Private Properties
    
    private var timer = Timer()
    private var countIterations = Constants.numberZero
    private var countSeconds = Constants.numberZero
    private var countMinutes = Constants.numberZero
    private var countHours = Constants.numberZero
    private var isStopwatchIsWorking = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Private IBAction
    
    @IBAction private func startPauseButtonAction(_ sender: UIButton) {
        guard isStopwatchIsWorking else {
            timer = Timer.scheduledTimer(
                timeInterval: Constants.timeInterval,
                target: self,
                selector: #selector(timerWorking),
                userInfo: nil,
                repeats: true
            )
            startPauseButton.setTitle(Constants.wordPause, for: .normal)
            resetButton.isHidden = false
            isStopwatchIsWorking = true
            return
        }
        timer.invalidate()
        startPauseButton.setTitle(Constants.wordContinue, for: .normal)
        isStopwatchIsWorking = false
    }
    
    @IBAction private func resetButton(_ sender: UIButton) {
        timer.invalidate()
        countIterations = Constants.numberZero
        countSeconds = Constants.numberZero
        countMinutes = Constants.numberZero
        countHours = Constants.numberZero
        currentTimeLabel.text = Constants.initialTime
        startPauseButton.setTitle(Constants.wordStart, for: .normal)
        resetButton.isHidden = true
        isStopwatchIsWorking = false
    }
    
    // MARK: - Private Methods
    
    private func setUI() {
        startPauseButton.layer.cornerRadius = startPauseButton.bounds.height / Constants.numberThree
        resetButton.layer.cornerRadius = resetButton.bounds.height / Constants.numberThree
        resetButton.isHidden = true
    }
    
    @objc private func timerWorking() {
        countIterations += Constants.numberOne
        countSeconds += Constants.numberOne
        if countSeconds > Constants.numberFiftyNine {
            countMinutes += Constants.numberOne
            countSeconds = Constants.numberZero
        }
        if countMinutes > Constants.numberFiftyNine {
            countHours += Constants.numberOne
            countMinutes = Constants.numberZero
        }
        if countHours > Constants.numberTwentyThree {
            countHours = Constants.numberZero
        }
        currentTimeLabel.text = String(format: Constants.timeFormat, countHours, countMinutes, countSeconds)
    }

}
