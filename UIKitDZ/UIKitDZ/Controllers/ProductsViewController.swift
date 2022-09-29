//
//  ProductsViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 26.09.2022.
//

import UIKit

/// ProductsViewController - экран с товарами
class ProductsViewController: UIViewController {

    private var productsImageView: UIImageView = {
        $0.image = UIImage(named: "Image1")
        return $0
    }(UIImageView())
    
    private lazy var productsSegmentedControl: UISegmentedControl = {
        $0.selectedSegmentIndex = 0
        $0.addTarget(self, action: #selector(setProductsImageAction(target:)), for: .valueChanged)
        return $0
    }(UISegmentedControl(items: productsNameArray))
    
    private lazy var sizeProductsSlider: UISlider = {
        $0.minimumValue = 44
        $0.maximumValue = 54
        $0.value = 49
        $0.thumbTintColor = .systemPurple
        $0.minimumTrackTintColor = .systemPurple
        $0.addTarget(self, action: #selector(setSizeProductsAction(target:)), for: .valueChanged)
        return $0
    }(UISlider())
    
    private var sizeProductsLabeL: UILabel = {
        $0.font = $0.font.withSize(30)
        $0.text = "49"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var makePurchaseButton: UIButton = {
        $0.setTitle("Оформить покупку", for: .normal)
        $0.backgroundColor = .systemPurple
        $0.addTarget(self, action: #selector(goToDeliveryVCAction(target:)), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private var productsImageArray = [UIImage(named: "Image1"),
                              UIImage(named: "image2"),
                              UIImage(named: "Image3"),
                              UIImage(named: "Image4"),
                              UIImage(named: "Image5")]
    private var productsNameArray = ["'HIG'", "'BAP'", "'JUT'", "'PEL'", "'HOK'"]
    
    var chooseProduct = ProductData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    @objc func setProductsImageAction(target: UISegmentedControl) {
        guard target == productsSegmentedControl else { return }
        let segmentIndex = target.selectedSegmentIndex
        chooseProduct.productsName = productsNameArray[segmentIndex]
        productsImageView.image = productsImageArray[segmentIndex]
    }
    
    @objc func setSizeProductsAction(target: UISlider) {
        guard target == sizeProductsSlider else { return }
        let segmentIndex = Int(target.value)
        chooseProduct.sizeProduct = segmentIndex
        sizeProductsLabeL.text = "\(segmentIndex)"
    }
    
    @objc func goToDeliveryVCAction(target: UIButton) {
        guard target == makePurchaseButton else { return }
        let deliveryVC = DeliveryViewController()
        deliveryVC.modalPresentationStyle = .fullScreen
        chooseProduct.productsName = productsNameArray[productsSegmentedControl.selectedSegmentIndex]
        chooseProduct.sizeProduct = Int(sizeProductsSlider.value)
        deliveryVC.buyerData.chooseProduct = chooseProduct
        present(deliveryVC, animated: true)
    }
    
    private func setUI() {
        view.backgroundColor = .white

        view.addSubview(productsImageView)
        view.addSubview(productsSegmentedControl)
        view.addSubview(sizeProductsSlider)
        view.addSubview(sizeProductsLabeL)
        view.addSubview(makePurchaseButton)
        
        productsImageView.frame = CGRect(x: view.frame.size.width / 2 - 175, y: 200, width: 350, height: 350)
        productsSegmentedControl.frame = CGRect(x: view.frame.size.width / 2 - 175, y: 570, width: 350, height: 40)
        sizeProductsSlider.frame = CGRect(x: view.frame.size.width / 2 - 175, y: 630, width: 350, height: 40)
        sizeProductsLabeL.frame = CGRect(x: view.frame.size.width / 2 - 175, y: 690, width: 350, height: 40)
        makePurchaseButton.frame = CGRect(x: view.frame.size.width / 2 - 175,
                                          y: view.frame.size.height - 120,
                                          width: 350,
                                          height: 50)
    }
}
