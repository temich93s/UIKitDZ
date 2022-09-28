//
//  ConspectViewController.swift
//  UIKitDZ
//
//  Created by 2lup on 27.09.2022.
//

import UIKit

/// ConspectViewController - конспект урока 7
class ConspectViewController: UIViewController {

    var segmentControll = UISegmentedControl()
    var imageView = UIImageView()
    
    var menuArray = ["one", "two", "three"]
    let imageArray = [UIImage(named: "Image1"),
                      UIImage(named: "Image2"),
                      UIImage(named: "Image3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = view.center
        imageView.image = imageArray[0]
        view.addSubview(imageView)

        segmentControll = UISegmentedControl(items: menuArray)
        segmentControll.frame = CGRect(x: 100, y: 600, width: 200, height: 30)
        view.addSubview(segmentControll)
        segmentControll.addTarget(self, action: #selector(selectedValueAction), for: .valueChanged)
    }
    
    @objc func selectedValueAction(target: UISegmentedControl) {
        if target == segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = imageArray[segmentIndex]
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }

}
