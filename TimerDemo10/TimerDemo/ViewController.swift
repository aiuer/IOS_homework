//
//  ViewController.swift
//  TimerDemo
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 tuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview: UIView!
    
    lazy var animator = UIDynamicAnimator(referenceView: self.view)
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(gravity)
        let pathRect = CGRect(x: 0, y: 0, width: 40, height: 40)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 10)
        //        let path = UIBezierPath(ovalIn: rect)
        path.lineWidth = 2
        UIColor.clear.setFill()
        UIColor.blue.setStroke()
        path.fill()
        path.stroke()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clicked(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 1, options: .curveEaseInOut, animations:
            {
            self.myview.center.x += 80
            self.myview.center.y += 80
        }){ (finished) in
            if finished {
                self.myview.center.x -= 20
                self.myview.center.y -= 80
            }
            
        }
    }
    
    @IBAction func changeSize(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 1, options: .curveLinear, animations: {
            self.myview.frame.size = CGSize(width: 20, height: 20)
        }){ (finished) in
            if finished {
                self.myview.frame.size = CGSize(width: 200, height: 200)
            }
        }
    }
    @IBAction func transForm(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 1, options: .curveLinear, animations: {
            self.myview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        })
    }
    @IBAction func changeColor(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 1, options: .curveLinear, animations: {
            self.myview.backgroundColor = UIColor.blue
        }){ (finished) in
            if finished {
                 self.myview.backgroundColor = UIColor.red
            }
        }
    }
    @IBAction func changeView(_ sender: Any) {
        UIView.transition(with: myview, duration: 3, options: .transitionCurlUp, animations: {
            self.myview.backgroundColor = UIColor.green
        }, completion: { (finished) in
            if finished {
                self.myview.backgroundColor = UIColor.red
            }
        })
    }
    @IBAction func pump(_ sender: Any) {
        let  width = Int(myview.bounds.width/10)
        let randx = Int(arc4random() % 10) * width
        let label = UILabel(frame: CGRect(x: randx, y: 10, width: width, height: width))
        label.backgroundColor = UIColor.green
        label.text = "Hoya"
        label.textAlignment = .center
        view.addSubview(label)
        gravity.addItem(label)
        collision.addItem(label)
        
    }
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
}

