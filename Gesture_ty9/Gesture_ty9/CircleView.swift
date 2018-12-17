//
//  CircleView.swift
//  Gesture_ty9
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 ty. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    @IBInspectable var fillcolor: UIColor?
    @IBInspectable var strokeColor: UIColor?
    
    func setup() {
        let panRecogizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer: )))
        self.addGestureRecognizer(panRecogizer)
        let pinchRecogizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecogizer)
        let tapRecogizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecogizer)
        let rotationRecogizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(recognizer:)))
        self.addGestureRecognizer(rotationRecogizer)
        
        tapRecogizer.numberOfTouchesRequired = 1
        tapRecogizer.numberOfTapsRequired = 2
    }
    @objc func rotation(recognizer: UIRotationGestureRecognizer) {
        let rotation = recognizer.rotation
        self.transform = self.transform.rotated(by: rotation)
        recognizer.rotation = 0
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .recognized:
            self.removeFromSuperview()
        default:
            break
        }
    }
    
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
        default:
            break
        }
    }
    
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        default:
            break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        fillcolor?.setFill()
        strokeColor?.setStroke()
        path.fill()
        path.stroke()
    }

}
