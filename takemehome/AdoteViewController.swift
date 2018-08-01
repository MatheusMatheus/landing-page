//
//  AdoteViewController.swift
//  takemehome
//
//  Created by student on 30/07/18.
//  Copyright © 2018 juan. All rights reserved.
//

import UIKit

class AdoteViewController: UIViewController {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    @IBOutlet weak var cardView: UIViewX!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let xFromCenter = card.center.x - view.center.x
        
        /*
         Degrees   Radians
         15          .26
         25          .43
         35          .61
         */
        let rotationAngle = xFromCenter/view.frame.width * 0.61
        let rotation = CGAffineTransform(rotationAngle: rotationAngle)
        
        // Maybe make this optional
        let scale = min(100/abs(xFromCenter) , 1)
        let stretchAndRotation = rotation.scaledBy(x: scale, y: scale)
        
        card.transform = stretchAndRotation
        card.center = sender.location(in: view)
        
        // Set Thumb Image
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "ThumpUp")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "ThumpDown")
            thumbImageView.tintColor = UIColor.red
        }
        
        // Show Thumb Image
        let alphaValue = abs(xFromCenter/view.center.x)
        thumbImageView.alpha = alphaValue
        
        if sender.state == UIGestureRecognizerState.ended {
            
            if card.center.x < 100 {
                // Thumbs Down
                // Move off to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 100)
                    card.alpha = 0
                })
                return
            } else if card.center.x > view.frame.width - 100 {
                // Thumbs Up
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 100)
                    card.alpha = 0
                })
                return
            }
            
            resetCard()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        resetCard()
    }
    
    func resetCard() {
        UIView.animate(withDuration: 0.2, animations: {
            self.cardView.alpha = 1
            self.cardView.transform = .identity
            self.cardView.center = self.view.center
            self.thumbImageView.alpha = 0
        })
    }
}
