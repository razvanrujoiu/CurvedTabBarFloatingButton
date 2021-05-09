//
//  CurvedTabBar.swift
//  CurvedTabBarFloatingButton
//
//  Created by Razvan Rujoiu on 09.05.2021.
//

import UIKit

@IBDesignable
class CurvedTabBar: UITabBar {
    
//    private var shapeLayer: CALayer?
    var shapeLayer: CAShapeLayer?
    private func addShape() {
        self.shapeLayer = CAShapeLayer()
        self.shapeLayer!.path = createPath()
//        self.shapeLayer!.fillColor = UIColor.hexStringToUIColor(hex: "#F3F3F3").cgColor


        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer!)
        } else {
            self.layer.insertSublayer(shapeLayer!, at: 0)
        }
        
    }
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0)) // the beginning of the trough

        path.addCurve(to: CGPoint(x: centerWidth, y: height),
        controlPoint1: CGPoint(x: (centerWidth - 30), y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height))

        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
        controlPoint1: CGPoint(x: centerWidth + 35, y: height), controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))

        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
            for member in subviews.reversed() {
                let subPoint = member.convert(point, from: self)
                guard let result = member.hitTest(subPoint, with: event) else { continue }
                return result
            }
            return nil
        }
}

@IBDesignable extension CurvedTabBar {
    
    @IBInspectable var fillColor: UIColor {
        set {
            shapeLayer?.fillColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: (shapeLayer?.fillColor)!)
        }
    }
}

