//
//  Conspect24VC.swift
//  magazineApp
//
//  Created by 2lup on 09.10.2022.
//

import UIKit

// MARK: Видеоурок 23, 24 -  Auto Layout Guide Code (VFL, NSLayout Anchor)

/*
/// Conspect24VC
class Conspect24VC: UIViewController {

    let view1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .red
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .blue
        return view
    }()
    
    let viewGreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    let viewOrange: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    let viewCyan: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        return view
    }()
    
    let viewBrown: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    let viewBlack: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(view1)
//        view.addSubview(view2)
//        createView1Constraint()
//        createView2Constraint()
        
        /*
        view.addSubview(viewGreen)
        view.addSubview(viewOrange)
        
        // задаем ключи для VFL
        let viewVFL = ["viewGreen": viewGreen, "viewOrange": viewOrange]
        
        // метрики (свои собственые расстояния)
        let metrics = ["height": 100, "width": view.bounds.size.width / 3, "top": view.bounds.size.width / 2]
        
        // добавляем правила констрейнтов в формате VFL
        // v - правило по вертикали
        // | - край экрана (левый потом правый)
        // V:|[viewGreen(100)]| - задали viewGreen высоту 100
        // - константа 8
        // -(50)- расстояние 50
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-top-[viewGreen(height)]|",
            options: [], metrics: metrics, views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-top-[viewOrange(height)]|",
            options: [], metrics: metrics, views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[viewGreen(width)]-(50)-[viewOrange(width)]-|",
            options: [], metrics: metrics, views: viewVFL))
        */
        
        view.addSubview(viewCyan)
        view.addSubview(viewBrown)
        view.addSubview(viewBlack)
        createViewCyanConstraint()
        createViewBrownConstraint()
        createViewBlackConstraint()
    }
    
    // констрйнты - их не используем вместо них VFL
//    func createView1Constraint() {
//        NSLayoutConstraint(item: view1,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerX,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view1,
//                           attribute: .centerY,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerY,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view1,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 200).isActive = true
//        NSLayoutConstraint(item: view1,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 200).isActive = true
//    }
//
//    func createView2Constraint() {
//        NSLayoutConstraint(item: view2,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view1,
//                           attribute: .centerX,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view2,
//                           attribute: .bottom,
//                           relatedBy: .equal,
//                           toItem: view1,
//                           attribute: .top,
//                           multiplier: 1,
//                           constant: -8).isActive = true
//        NSLayoutConstraint(item: view2,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 100).isActive = true
//        NSLayoutConstraint(item: view2,
//                           attribute: .height,
//                           relatedBy: .equal,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1,
//                           constant: 100).isActive = true
//    }

    func createViewCyanConstraint() {
        viewCyan.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewCyan.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        viewCyan.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewCyan.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createViewBrownConstraint() {
        viewBrown.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        viewBrown.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        viewBrown.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewBrown.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createViewBlackConstraint() {
        viewBlack.rightAnchor.constraint(equalTo: viewBrown.rightAnchor).isActive = true
        viewBlack.leftAnchor.constraint(equalTo: viewCyan.leftAnchor).isActive = true
        viewBlack.bottomAnchor.constraint(equalTo: viewCyan.topAnchor, constant: -20).isActive = true
        viewBlack.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
*/
