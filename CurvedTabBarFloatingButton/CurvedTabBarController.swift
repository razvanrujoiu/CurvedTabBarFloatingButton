
//  CurvedTabBarController.swift
//  CurvedTabBarFloatingButton
//
//  Created by Razvan Rujoiu on 09.05.2021.
//

import UIKit

public class CurvedTabBarController: UITabBarController, CurvedTabBarControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
//        let image = UIImage(systemName: "person.fill")
//        let btnColor = UIColor.hexStringToUIColor(hex: "#f3f3f3")
//        self.setupMiddleButton(elevation: -45, width: 70,height: 70,image: image, buttonColor: btnColor)
    }
    
    public func setupMiddleButton(elevation: CGFloat, width: CGFloat, height: CGFloat, image: UIImage?, buttonColor: UIColor?) {

        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-(height/2), y: elevation, width: width, height: height))
        
        //STYLE THE BUTTON YOUR OWN WAY
        middleBtn.backgroundColor = buttonColor
        middleBtn.setImage(image, for: .normal)
        middleBtn.cornerRadius = height/2
                
        //add to the tabbar and add click event
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

        self.view.layoutIfNeeded()
    }

    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
    }
}

