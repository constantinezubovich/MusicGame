//
//  ContainerViewController.swift
//  MusicGame
//
//  Created by Constantine on 29.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation
import UIKit

class ContainerViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    func removeChildViewController() {
        if let vc = self.childViewControllers.last {
            vc.willMove(toParentViewController: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParentViewController()
        }
    }
    
    func loadChildViewController(vc: UIViewController) {
        removeChildViewController()
        addChildViewController(vc)
        vc.view.frame = CGRect(x: 0, y: 0, width: containerView.frame.size.width, height: containerView.frame.size.height)
        containerView.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
    }
}
