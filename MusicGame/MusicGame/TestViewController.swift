//
//  TestViewController.swift
//  MusicGame
//
//  Created by Constantine on 27.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func drawTapped(_ sender: UIButton) {
        
        drawLine()
    }
    
    func drawCircle() {
        let circle = UIView(frame: CGRect(x: view.bounds.midX - 100, y: view.bounds.midY - 100, width: 200, height: 200))
        
        var progressCircle = CAShapeLayer()
        
        let circleRadius : CGFloat = circle.bounds.width / 2
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: circle.bounds.midX, y: circle.bounds.midY), radius: circleRadius, startAngle: CGFloat(1.5 * M_PI), endAngle: CGFloat(3.5 * M_PI), clockwise: true)
        
        progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.cgPath
        progressCircle.strokeColor = UIColor.blue.cgColor
        progressCircle.fillColor = UIColor.clear.cgColor
        progressCircle.lineWidth = 4
        progressCircle.strokeStart = 0
        progressCircle.strokeEnd = 1.0
        circle.layer.addSublayer(progressCircle)
        
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 2.0
        progressCircle.add(animation, forKey: "animation")
        self.view.addSubview(circle)
    }
    
    func drawLine() {
        
        let line = UIView(frame: CGRect(x: view.bounds.midX - 2, y: view.bounds.midY - 200, width: 4, height: 0))
        line.backgroundColor = UIColor.blue
        
        view.addSubview(line)
        
        let height: CGFloat = 100
        
        UIView.animate(withDuration: 2, animations: {
            
            line.frame = CGRect(x: self.view.bounds.midX - 3, y: self.view.bounds.midY - 200, width: 4, height: height)
            
        }) { successful in
            if successful {
                self.drawCircle()
            }
        }
        
    }
}

