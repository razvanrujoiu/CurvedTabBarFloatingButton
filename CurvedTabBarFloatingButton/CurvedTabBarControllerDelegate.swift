//
//  CurvedTabBarControllerDelegate.swift
//  CurvedTabBarFloatingButton
//
//  Created by Razvan Rujoiu on 09.05.2021.
//

import UIKit

public protocol CurvedTabBarControllerDelegate: UITabBarControllerDelegate {
    
    func setupMiddleButton(elevation: CGFloat, width: CGFloat, height: CGFloat, image: UIImage?, buttonColor: UIColor?)
}
