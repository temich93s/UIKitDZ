//
//  AlarmClockViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 30.09.2022.
//

import UIKit

// MARK: - AlarmClockViewController

/// Экран будильника
final class AlarmClockViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet private weak var setAlarmClock: UIButton!
    @IBOutlet private weak var firstAlarmSwitch: UISwitch!
    @IBOutlet private weak var secondAlarmSwitch: UISwitch!
    @IBOutlet private weak var thirdAlarmSwitch: UISwitch!
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Private Methods

    private func setUI() {
        firstAlarmSwitch.layer.cornerRadius = 16
        firstAlarmSwitch.backgroundColor = .darkGray
        secondAlarmSwitch.layer.cornerRadius = 16
        secondAlarmSwitch.backgroundColor = .darkGray
        thirdAlarmSwitch.layer.cornerRadius = 16
        thirdAlarmSwitch.backgroundColor = .darkGray
        setAlarmClock.layer.cornerRadius = 10
    }

}
