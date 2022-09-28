//
//  LostBirthdayViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 25.09.2022.
//

import UIKit

/// ListBirthdayViewController - окно со списком дней рождений
class ListBirthdayViewController: UIViewController {

    var birthdayDataArray = [BirthdayData(name: "Рома",
                                          description: "24 марта, в среду исполняется 54 года",
                                          countDays: "92 дней"),
                             BirthdayData(name: "Ваня",
                                          description: "02 апреля, в среду исполняется 34 года",
                                          countDays: "108 дней"),
                             BirthdayData(name: "Миша",
                                          description: "12 мая, в среду исполняется 44 года",
                                          countDays: "121 дней")]
    
    private lazy var backButton: UIButton = {
        $0.setTitle("〈 Back", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(backToLoginAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var addProfileButton: UIButton = {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(addProfileAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private let logoLabel: UILabel = {
        $0.textAlignment = .center
        $0.text = "Birthday"
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    @objc func backToLoginAction() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
    
    @objc func addProfileAction() {
        let profilePersonVC = ProfilePersonViewController()
        profilePersonVC.modalPresentationStyle = .formSheet
        profilePersonVC.birthdayDataArray = birthdayDataArray
        present(profilePersonVC, animated: true)
    }
    
    func setProfile() {
        for indexCurrentPerson in 0..<birthdayDataArray.count {
            addProfile(name: birthdayDataArray[indexCurrentPerson].name,
                       description: birthdayDataArray[indexCurrentPerson].description,
                       countDays: birthdayDataArray[indexCurrentPerson].countDays,
                       position: indexCurrentPerson)
        }
    }
    
    func addProfile(name: String, description: String, countDays: String, position: Int) {
        let imageProfileImageView: UIImageView = {
            $0.image = UIImage(systemName: "person.circle.fill")
            $0.tintColor = .gray
            return $0
        }(UIImageView())
        
        let namePersonLabel: UILabel = {
            $0.textAlignment = .left
            $0.text = name
            return $0
        }(UILabel())
        
        let descriptionPersonLabel: UILabel = {
            $0.textAlignment = .left
            $0.textColor = .gray
            $0.font = $0.font.withSize(15)
            $0.text = description
            return $0
        }(UILabel())
        
        let countDaysOfBirthdayPersonLabel: UILabel = {
            $0.textAlignment = .right
            $0.textColor = .gray
            $0.text = countDays
            return $0
        }(UILabel())
        
        view.addSubview(imageProfileImageView)
        view.addSubview(namePersonLabel)
        view.addSubview(descriptionPersonLabel)
        view.addSubview(countDaysOfBirthdayPersonLabel)
        
        let offset = position * 80
        
        imageProfileImageView.frame = CGRect(x: 10, y: offset + 120, width: 80, height: 80)
        namePersonLabel.frame = CGRect(x: 90, y: offset + 120, width: 210, height: 40)
        countDaysOfBirthdayPersonLabel.frame = CGRect(x: 300, y: offset + 120, width: 100, height: 40)
        descriptionPersonLabel.frame = CGRect(x: 90, y: offset + 160, width: 310, height: 40)

    }
    
    private func setUI() {
        setProfile()
        view.backgroundColor = .white
        view.addSubview(logoLabel)
        view.addSubview(backButton)
        view.addSubview(addProfileButton)
        
        logoLabel.frame = CGRect(x: view.center.x - 50, y: 50, width: 100, height: 60)
        backButton.frame = CGRect(x: 0, y: 50, width: 100, height: 60)
        addProfileButton.frame = CGRect(x: view.frame.size.width - 80, y: 50, width: 100, height: 60)
    }
    
}
