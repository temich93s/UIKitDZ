//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

// MARK: - StopwatchViewController

/// Экран с секундомером
final class StopwatchViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var currentTime: UILabel!
    @IBOutlet private weak var startPauseButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: - Private Properties
    
    private var timer = Timer()
    private var countIterations = Constants.numberZero
    private var countSeconds = Constants.numberZero
    private var countMinutes = Constants.numberZero
    private var countHours = Constants.numberZero
    private var stopwatchIsWorking = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - IBAction
    
    @IBAction private func startPauseButtonAction(_ sender: UIButton) {
        guard stopwatchIsWorking else {
            timer = Timer.scheduledTimer(
                timeInterval: Constants.timeInterval,
                target: self,
                selector: #selector(timerWorking),
                userInfo: nil,
                repeats: true
            )
            startPauseButton.setTitle(Constants.wordPause, for: .normal)
            resetButton.isHidden = false
            stopwatchIsWorking = true
            return
        }
        timer.invalidate()
        startPauseButton.setTitle(Constants.wordContinue, for: .normal)
        stopwatchIsWorking = false
    }
    
    @IBAction private func resetButton(_ sender: UIButton) {
        timer.invalidate()
        countIterations = Constants.numberZero
        countSeconds = Constants.numberZero
        countMinutes = Constants.numberZero
        countHours = Constants.numberZero
        currentTime.text = Constants.initialTime
        startPauseButton.setTitle(Constants.wordStart, for: .normal)
        resetButton.isHidden = true
        stopwatchIsWorking = false
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
        currentTime.text = String(format: Constants.timeFormat, countHours, countMinutes, countSeconds)
    }
    
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
}
