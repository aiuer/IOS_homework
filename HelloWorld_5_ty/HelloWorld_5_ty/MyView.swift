//
//  MyView.swift
//  HelloWorld_5_ty
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 2016110439. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    private var function: ((CGFloat) -> CGFloat)?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let rectPath = UIBezierPath(rect: rect)
        UIColor.white.setFill()
        rectPath.fill()
        let path = UIBezierPath()
        UIColor.black.setStroke()
        path.move(to: CGPoint(x: 0, y: rect.height / 2))
        path.addLine(to: CGPoint(x:rect.width,y:rect.height / 2))
        path.stroke()
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        path.stroke()
        
        if function != nil {
            let path = curve(rect: rect, color: UIColor.red, function: function!)
            path.stroke()
        }
    }
    func drawCurve(function: @escaping (CGFloat) -> CGFloat) {
        self.function = function
        self.draw(self.frame)
    }

    private func curve(rect: CGRect, color: UIColor, function: (CGFloat) -> CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        let center = rect.width / 2
        let height = rect.height / 2
        let rate:CGFloat = 100
        color.setStroke()
        path.move(to: CGPoint(x: center, y: height - function(0) / rate))
        for item in stride(from: center / rate, through: center, by: center / rate){
            path.addLine(to: CGPoint(x: center - item, y: height - function(-item) / rate))
        }
        return path
    }
}
