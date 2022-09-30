//
//  AlarmClockViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 30.09.2022.
//

import UIKit

/// Экран будильника
final class AlarmClockViewController: UIViewController {

    @IBOutlet weak var setAlarmClock: UIButton!
    @IBOutlet weak var firstAlarmSwitch: UISwitch!
    @IBOutlet weak var secondAlarmSwitch: UISwitch!
    @IBOutlet weak var thirdAlarmSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

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
