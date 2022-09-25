//
//  ProfilePersonViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 25.09.2022.
//

import UIKit

/// ProfilePersonViewController - окно с профилем человека
class ProfilePersonViewController: UIViewController, UITextFieldDelegate {

    var birthdayDataArray: [BirthdayData] = [BirthdayData]()
    private var agePerson = ""
    
    private lazy var backButton: UIButton = {
        $0.setTitle("Отмена", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(backListBirthdayAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var addPersonButton: UIButton = {
        $0.setTitle("Добавить", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.contentHorizontalAlignment = .right
        $0.addTarget(self, action: #selector(addPersonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    let imageProfileImageView: UIImageView = {
        $0.image = UIImage(systemName: "person.circle.fill")
        $0.tintColor = .gray
        return $0
    }(UIImageView())
    
    let changePhotoLabel: UILabel = {
        $0.textAlignment = .center
        $0.text = "Изменить фото"
        return $0
    }(UILabel())
    
    private let namePersonLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .left
        $0.text = "Имя"
        return $0
    }(UILabel())
    
    private let namePersonTextField: UITextField = {
        $0.textAlignment = .left
        $0.placeholder = "Введите имя"
        return $0
    }(UITextField())
    
    private let birthdayPersonLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .left
        $0.text = "Дата"
        return $0
    }(UILabel())
    
    private lazy var setBirthdayPersonPickerView: UIDatePicker = {
        $0.datePickerMode = .date
        $0.addTarget(self, action: #selector(setBirthdayPerson(picker:)), for: .valueChanged)
        return $0
    }(UIDatePicker())
    
    private let agePersonLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .left
        $0.text = "Возраст"
        return $0
    }(UILabel())
    
    private let setAgePersonPickerView = UIPickerView()
    
    private let sexPersonLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .left
        $0.text = "Пол"
        return $0
    }(UILabel())
    
    private let setSexPersonPickerView = UIPickerView()
    
    private let instagramIdPersonLabel: UILabel = {
        $0.textColor = .blue
        $0.textAlignment = .left
        $0.text = "Instagram"
        return $0
    }(UILabel())
    
    private lazy var addInstagramIdPersonButton: UIButton = {
        $0.setTitle("Добавить", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.addTarget(self, action: #selector(addInstagramIdPerson), for: .touchUpInside)
        return $0
    }(UIButton())
    
    @objc func backListBirthdayAction() {
        dismiss(animated: true)
    }
    
    @objc func addPersonAction() {
        let listBirthdayVC = ListBirthdayViewController()
        listBirthdayVC.modalPresentationStyle = .fullScreen
        guard let namePerson = namePersonTextField.text, !namePerson.isEmpty else { return }
        birthdayDataArray.append(
            BirthdayData(name: namePerson,
                         description: "ДР: " +
                         "\(setBirthdayPersonPickerView.date.formatted(date: .abbreviated, time: .omitted))" +
                         " исполнится \(agePerson) года",
                         countDays: "99 дней"))
        listBirthdayVC.birthdayDataArray = birthdayDataArray
        present(listBirthdayVC, animated: true)
    }
    
    @objc func setBirthdayPerson(picker: UIDatePicker) {
        guard picker.isEqual(self.setBirthdayPersonPickerView) else { return }
        print("picker: \(picker.date)")
    }
    
    @objc func addInstagramIdPerson() {
        let alertController = UIAlertController(title: "",
                                                message: "Введите username Instagram",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            guard let safeText = alertController.textFields?.first?.text else { return }
            if safeText.isEmpty {
                self.addInstagramIdPersonButton.setTitle("Добавить", for: .normal)
            } else {
                self.addInstagramIdPersonButton.setTitle("\(safeText)", for: .normal)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        setAgePersonPickerView.dataSource = self
        setAgePersonPickerView.delegate = self
        setSexPersonPickerView.dataSource = self
        setSexPersonPickerView.delegate = self
        
        namePersonTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(addPersonButton)
        view.addSubview(imageProfileImageView)
        view.addSubview(changePhotoLabel)
        view.addSubview(namePersonLabel)
        view.addSubview(namePersonTextField)
        view.addSubview(birthdayPersonLabel)
        view.addSubview(setBirthdayPersonPickerView)
        view.addSubview(agePersonLabel)
        view.addSubview(setAgePersonPickerView)
        view.addSubview(sexPersonLabel)
        view.addSubview(setSexPersonPickerView)
        view.addSubview(instagramIdPersonLabel)
        view.addSubview(addInstagramIdPersonButton)
        
        backButton.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        addPersonButton.frame = CGRect(x: view.frame.size.width - 120, y: 0, width: 100, height: 60)
        imageProfileImageView.frame = CGRect(x: view.frame.size.width / 2 - 75, y: 60, width: 150, height: 150)
        changePhotoLabel.frame = CGRect(x: view.frame.size.width / 2 - 75, y: 210, width: 150, height: 40)
        namePersonLabel.frame = CGRect(x: 20, y: 260, width: 300, height: 40)
        namePersonTextField.frame = CGRect(x: 20, y: 300, width: 300, height: 40)
        birthdayPersonLabel.frame = CGRect(x: 20, y: 350, width: 300, height: 40)
        setBirthdayPersonPickerView.frame = CGRect(x: 20, y: 390, width: 150, height: 40)
        agePersonLabel.frame = CGRect(x: 20, y: 440, width: 150, height: 40)
        setAgePersonPickerView.frame = CGRect(x: 20, y: 480, width: 150, height: 50)
        sexPersonLabel.frame = CGRect(x: 20, y: 540, width: 150, height: 40)
        setSexPersonPickerView.frame = CGRect(x: 20, y: 580, width: 150, height: 50)
        instagramIdPersonLabel.frame = CGRect(x: 20, y: 640, width: 150, height: 40)
        addInstagramIdPersonButton.frame = CGRect(x: 20, y: 680, width: 150, height: 40)
    }
}

extension ProfilePersonViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case setSexPersonPickerView:
            return 2
        case setAgePersonPickerView:
            return 120
        default:
            return 0
        }
    }
    
}

extension ProfilePersonViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case setSexPersonPickerView:
            if row == 0 {
                return "Мужчина"
            } else {
                return "Женщина"
            }
        case setAgePersonPickerView:
            return "\(row)"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case setAgePersonPickerView:
            agePerson = "\(row)"
        default:
            break
        }
    }
}
