//
//  ViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 21.09.2022.
//

import UIKit

/// Экран самой читалки
final class ReaderViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let fontCourier = "Courier"
        static let fontHelvetica = "Helvetica"
        static let fontGeorgia = "Georgia"
        static let fontThonburi = "Thonburi"
        
        static let fontCourierBold = "Courier-Bold"
        static let fontHelveticaBold = "Helvetica-Bold"
        static let fontGeorgiaBold = "Georgia-Bold"
        static let fontThonburiBold = "Thonburi-Bold"
        
        static let sizeTextForLabelAndButton: CGFloat = 24
        static let maximumSizeText: CGFloat = 50
        static let basicSizeText: CGFloat = 20
        static let minimumSizeText: CGFloat = 10
        
        static let textAlignmentCenter = NSTextAlignment.center
        
        static let numberOfComponentsForFontTextPicker = 1
        static let numberOfRowForFontTextPicker = 4
        static let numberZero = 0
        
        static let bigSymbolA = "A"
        static let smallSymbolA = "a"
        static let wordBlack = "Black"
        static let wordWhite = "White"
        static let nameImageShareButton = "shareplay"
        
        static let colorBlack = UIColor.black
        static let colorWhite = UIColor.white
        static let colorRed = UIColor.red
        static let colorCyan = UIColor.cyan
        static let colorOrange = UIColor.orange
        static let colorGreen = UIColor.green
        static let colorGray = UIColor.gray
        
        static let textBook = """
            Swift - это фантастический способ писать приложения для телефонов.
            Для десктопных компьютеров, серверов, да и чего-либо еще, что запускает и работает при помощи кода.
            Swift - безопасный, быстрый и интерактивный язык программирования.
            Swift вобрал в себя лучшие идеи современных языков с мудростью инженерной культуры Apple.
            Компилятор оптимизирован для производительности.
            А язык оптимизирован для разработки, без компромиссов с одной или другой стороны.
            
            Swift дружелюбен по отношению к новичкам в программировании.
            Это первый язык программирования промышленного качества.
            Который также понятен и увлекателен, как скриптовый язык.
            Написание кода в песочнице позволяет экспериментировать с кодом Swift.
            И видеть результат мгновенно, без необходимости компилировать и запускать приложение.
            
            Swift исключает большой пласт распространенных программных ошибок.
            При помощи применения современных программных паттернов:
            - Переменные всегда инициализированы до того, как будут использованы.
            - Индексы массивов всегда проверяются на out-of-bounds ошибки.
            - Целые числа проверяются на переполнение.
            - Опционалы гарантируют, что значения nil будут явно обработаны.
            - Автоматическое управление памятью
            - Обработка ошибок позволяет осуществлять контролируемое восстановление от непредвиденных ошибок.
            
            Код на Swift скомпилирован и оптимизирован, чтобы получать максимальную отдачу от современного оборудования.
            Синтаксис и стандартная библиотека спроектированы основываясь на руководстве.
            Что самый очевидный и простой способ написания кода является лучшим вариантом.
            Комбинация безопасности и скорости делает Swift лучшим кандидатом для написания программ.
            От уровня "Hello, World!" и до целой операционной системы.
            
            Swift совмещает вывод типов и паттерн-матчинг с современным простым синтаксисом.
            Позволяя сложным идеям быть выраженными просто и кратко.
            И в качестве результата не только становится проще писать код.
            Но и читать его и поддерживать так же становится просто.
            
            Swift уже имеет за плечами годы развития, и он продолжает развиваться.
            Включая в себя все новые и новые возможности.
            Наши цели на Swift очень амбициозные.
            Мы с нетерпением ждем, чтобы увидеть что у вас получится создать с его помощью.
            """
    }
    
    // MARK: - Private Properties
    
    private lazy var readerTextView: UITextView = {
        $0.text = Constants.textBook
        $0.textColor = Constants.colorOrange
        $0.font = UIFont(name: currentTextFont, size: currentTextSize)
        return $0
    }(UITextView())
    
    private lazy var sizeTextLabel: UILabel = {
        $0.text = "\(Int(currentTextSize))"
        $0.textAlignment = Constants.textAlignmentCenter
        $0.font = UIFont.boldSystemFont(ofSize: Constants.sizeTextForLabelAndButton)
        return $0
    }(UILabel())
    
    private lazy var smallWeightFontButton: UIButton = {
        $0.setTitle("\(Constants.smallSymbolA)", for: .normal)
        $0.backgroundColor = Constants.colorGray
        $0.addTarget(self, action: #selector(smallWeightFontAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var bigWeightFontButton: UIButton = {
        $0.setTitle("\(Constants.bigSymbolA)", for: .normal)
        $0.backgroundColor = Constants.colorGray
        $0.addTarget(self, action: #selector(bigWeightFontAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var redTextColorButton: UIButton = {
        $0.backgroundColor = Constants.colorRed
        $0.addTarget(self, action: #selector(redTextColorButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var cyanTextColorButton: UIButton = {
        $0.backgroundColor = Constants.colorCyan
        $0.addTarget(self, action: #selector(cyanTextColorButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var greenTextColorButton: UIButton = {
        $0.backgroundColor = Constants.colorGreen
        $0.addTarget(self, action: #selector(greenTextColorButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var orangeTextColorButton: UIButton = {
        $0.backgroundColor = Constants.colorOrange
        $0.addTarget(self, action: #selector(orangeTextColorButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var themeReaderSegmentedControl: UISegmentedControl = {
        $0.insertSegment(withTitle: Constants.wordWhite, at: 0, animated: true)
        $0.insertSegment(withTitle: Constants.wordBlack, at: 1, animated: true)
        $0.selectedSegmentIndex = Constants.numberZero
        $0.backgroundColor = Constants.colorGray
        $0.addTarget(self, action: #selector(themeReaderSegmentedControlAction), for: .valueChanged)
        return $0
    }(UISegmentedControl())
    
    private lazy var sizeTextSlider: UISlider = {
        $0.maximumValue = Float(Constants.maximumSizeText)
        $0.minimumValue = Float(Constants.minimumSizeText)
        $0.value = Float(currentTextSize)
        $0.maximumTrackTintColor = Constants.colorGray
        $0.addTarget(self, action: #selector(sizeTextAction), for: .valueChanged)
        return $0
    }(UISlider())
    
    private var fontTextPicker: UIPickerView = {
        $0.backgroundColor = Constants.colorGray
        return $0
    }(UIPickerView())
    
    private lazy var shareTextBookButton: UIButton = {
        $0.backgroundColor = Constants.colorGray
        $0.tintColor = Constants.colorWhite
        $0.setImage(UIImage(systemName: Constants.nameImageShareButton), for: .normal)
        $0.addTarget(self, action: #selector(shareTextBookButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private var currentTextSize: CGFloat = Constants.basicSizeText
    private var currentTextFont = Constants.fontHelvetica
    private var currentWeightFontIsBig = false
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegateAndDataSource()
    }
    
    // MARK: - Private Methods
    
    private func setDelegateAndDataSource() {
        fontTextPicker.delegate = self
        fontTextPicker.dataSource = self
    }
    
    private func setupUI() {
        setupReaderTextView()
        setupSizeTextLabel()
        setupSizeTextSlider()
        setupFontTextPicker()
        setupSmallWeightFontButton()
        setupBigWeightFontButton()
        setupRedTextColorButton()
        setupCyanTextColorButton()
        setupGreenTextColorButton()
        setupOrangeTextColorButton()
        setupThemeReaderSegmentedControl()
        setupShareTextBookButton()
    }
    
    private func setupReaderTextView() {
        view.addSubview(readerTextView)
        readerTextView.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: view.bounds.height - 320)
    }
    
    private func setupSizeTextLabel() {
        view.addSubview(sizeTextLabel)
        sizeTextLabel.frame = CGRect(x: view.center.x - 50, y: readerTextView.frame.maxY, width: 100, height: 40)
    }
    
    private func setupSizeTextSlider() {
        view.addSubview(sizeTextSlider)
        sizeTextSlider.frame = CGRect(x: view.center.x - 150, y: sizeTextLabel.frame.maxY, width: 300, height: 20)
    }
    
    private func setupFontTextPicker() {
        view.addSubview(fontTextPicker)
        fontTextPicker.frame = CGRect(x: view.center.x - 90, y: sizeTextSlider.frame.maxY + 10, width: 180, height: 40)
    }
    
    private func setupSmallWeightFontButton() {
        view.addSubview(smallWeightFontButton)
        smallWeightFontButton.frame = CGRect(
            x: view.center.x - 50,
            y: fontTextPicker.frame.maxY + 10,
            width: 40,
            height: 40
        )
    }
    
    private func setupBigWeightFontButton() {
        view.addSubview(bigWeightFontButton)
        bigWeightFontButton.frame = CGRect(
            x: view.center.x + 10,
            y: fontTextPicker.frame.maxY + 10,
            width: 40,
            height: 40
        )
    }
    
    private func setupRedTextColorButton() {
        view.addSubview(redTextColorButton)
        redTextColorButton.frame = CGRect(
            x: view.center.x - 110,
            y: bigWeightFontButton.frame.maxY + 10,
            width: 40,
            height: 40
        )
    }
    
    private func setupCyanTextColorButton() {
        view.addSubview(cyanTextColorButton)
        cyanTextColorButton.frame = CGRect(
            x: view.center.x + 70,
            y: bigWeightFontButton.frame.maxY + 10,
            width: 40,
            height: 40
        )
    }
    
    private func setupGreenTextColorButton() {
        view.addSubview(greenTextColorButton)
        greenTextColorButton.frame = CGRect(
            x: view.center.x + 10,
            y: bigWeightFontButton.frame.maxY + 10,
            width: 40,
            height: 40
        )
    }
    
    private func setupOrangeTextColorButton() {
        view.addSubview(orangeTextColorButton)
        orangeTextColorButton.frame = CGRect(
            x: view.center.x - 50,
            y: bigWeightFontButton.frame.maxY + 10,
            width: 40,
            height: 40
        )
    }
    
    private func setupThemeReaderSegmentedControl() {
        view.addSubview(themeReaderSegmentedControl)
        themeReaderSegmentedControl.frame = CGRect(
            x: view.center.x + 50,
            y: readerTextView.frame.maxY + 5,
            width: 100,
            height: 30
        )
    }
    
    private func setupShareTextBookButton() {
        view.addSubview(shareTextBookButton)
        shareTextBookButton.frame = CGRect(
            x: view.center.x - 150,
            y: readerTextView.frame.maxY + 10,
            width: 30,
            height: 30
        )
        shareTextBookButton.layer.cornerRadius = shareTextBookButton.frame.height / 4
    }
    
    @objc private func shareTextBookButtonAction() {
        let safeActivityVC = UIActivityViewController(
            activityItems: [Constants.textBook],
            applicationActivities: nil
        )
        present(safeActivityVC, animated: true, completion: nil)
    }
    
    @objc private func sizeTextAction() {
        currentTextSize = CGFloat(sizeTextSlider.value)
        sizeTextLabel.text = "\(Int(currentTextSize))"
        readerTextView.font = UIFont(name: currentTextFont, size: currentTextSize)
    }
    
    @objc private func redTextColorButtonAction() {
        readerTextView.textColor = Constants.colorRed
    }
    
    @objc private func cyanTextColorButtonAction() {
        readerTextView.textColor = Constants.colorCyan
    }
    
    @objc private func greenTextColorButtonAction() {
        readerTextView.textColor = Constants.colorGreen
    }
    
    @objc private func orangeTextColorButtonAction() {
        readerTextView.textColor = Constants.colorOrange
    }
    
    @objc private func themeReaderSegmentedControlAction() {
        switch themeReaderSegmentedControl.selectedSegmentIndex {
        case 0:
            readerTextView.backgroundColor = Constants.colorWhite
            view.backgroundColor = Constants.colorWhite
            sizeTextLabel.textColor = Constants.colorBlack
        case 1:
            readerTextView.backgroundColor = Constants.colorBlack
            view.backgroundColor = Constants.colorBlack
            sizeTextLabel.textColor = Constants.colorWhite
        default:
            break
        }
    }
    
    @objc private func smallWeightFontAction() {
        currentWeightFontIsBig = false
        switch currentTextFont {
        case Constants.fontCourierBold:
            currentTextFont = Constants.fontCourier
        case Constants.fontHelveticaBold:
            currentTextFont = Constants.fontHelvetica
        case Constants.fontGeorgiaBold:
            currentTextFont = Constants.fontGeorgia
        case Constants.fontThonburiBold:
            currentTextFont = Constants.fontThonburi
        default:
            break
        }
        readerTextView.font = UIFont(name: currentTextFont, size: currentTextSize)
    }
    
    @objc private func bigWeightFontAction() {
        currentWeightFontIsBig = true
        switch currentTextFont {
        case Constants.fontCourier:
            currentTextFont = Constants.fontCourierBold
        case Constants.fontHelvetica:
            currentTextFont = Constants.fontHelveticaBold
        case Constants.fontGeorgia:
            currentTextFont = Constants.fontGeorgiaBold
        case Constants.fontThonburi:
            currentTextFont = Constants.fontThonburiBold
        default:
            break
        }
        readerTextView.font = UIFont(name: currentTextFont, size: currentTextSize)
    }
    
}

// MARK: - UIPickerViewDelegate

extension ReaderViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "\(Constants.fontHelvetica)"
        case 1:
            return "\(Constants.fontGeorgia)"
        case 2:
            return "\(Constants.fontThonburi)"
        case 3:
            return "\(Constants.fontCourier)"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch currentWeightFontIsBig {
        case true:
            switch row {
            case 0:
                currentTextFont = Constants.fontHelveticaBold
            case 1:
                currentTextFont = Constants.fontGeorgiaBold
            case 2:
                currentTextFont = Constants.fontThonburiBold
            case 3:
                currentTextFont = Constants.fontCourierBold
            default:
                break
            }
        case false:
            switch row {
            case 0:
                currentTextFont = Constants.fontHelvetica
            case 1:
                currentTextFont = Constants.fontGeorgia
            case 2:
                currentTextFont = Constants.fontThonburi
            case 3:
                currentTextFont = Constants.fontCourier
            default:
                break
            }
        }
        readerTextView.font = UIFont(name: currentTextFont, size: currentTextSize)
    }
}

// MARK: - UIPickerViewDataSource

extension ReaderViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constants.numberOfComponentsForFontTextPicker
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.numberOfRowForFontTextPicker
    }
    
}
