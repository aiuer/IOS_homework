//
//  myView.swift
//  view_4_ty
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 tuyao. All rights reserved.
//

import UIKit

class myView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.purple.setStroke()
        path.stroke()
        UIColor.green.setFill()
        path.fill()
    }
    
}
