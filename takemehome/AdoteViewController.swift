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
    @IBOutlet weak var fotoPet: UIImageViewX!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var subtitulo: UILabel!
    
    let images = [#imageLiteral(resourceName: "foto1"),#imageLiteral(resourceName: "foto2"),#imageLiteral(resourceName: "foto3"),#imageLiteral(resourceName: "foto4"),#imageLiteral(resourceName: "foto5"),#imageLiteral(resourceName: "foto6"),#imageLiteral(resourceName: "foto7"),#imageLiteral(resourceName: "foto8"),#imageLiteral(resourceName: "foto9"),#imageLiteral(resourceName: "foto10")]
    var pets: [Pet] = PetResource.getPets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoPet.image = images[Incrementador.index]
        titulo.text = pets[Incrementador.index].nome
        subtitulo.text = pets[Incrementador.index].infoPet
    }
    
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let xFromCenter = card.center.x - view.center.x
        

        let rotationAngle = xFromCenter/view.frame.width * 0.61
        let rotation = CGAffineTransform(rotationAngle: rotationAngle)
        
 
        let scale = min(100/abs(xFromCenter) , 1)
        let stretchAndRotation = rotation.scaledBy(x: scale, y: scale)
        
        card.transform = stretchAndRotation
        card.center = sender.location(in: view)
        
   
        if xFromCenter > 0 {
            thumbImageView.image = #imageLiteral(resourceName: "ThumpUp")
            thumbImageView.tintColor = UIColor.green
        } else {
            thumbImageView.image = #imageLiteral(resourceName: "ThumpDown")
            thumbImageView.tintColor = UIColor.red
        }
        
        let alphaValue = abs(xFromCenter/view.center.x)
        thumbImageView.alpha = alphaValue
        
        if sender.state == UIGestureRecognizerState.ended {
            if card.center.x < 100 {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 100)
                    card.alpha = 0
                })
                if Incrementador.index >= 0 && Incrementador.index < images.count-1 {
                    Incrementador.index += 1
                    newCard()
                }
                return
            } else if card.center.x > view.frame.width - 100 {
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 100)
                    card.alpha = 0
                })
                if Incrementador.index > 0 && Incrementador.index <= images.count {
                    Incrementador.index -= 1
                    newCard()
                }
                return
            }
            resetCard()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        resetCard()
    }
    
    func newCard() {
        resetCard()
        self.fotoPet.image = images[Incrementador.index]
        self.titulo.text = pets[Incrementador.index].nome
        self.subtitulo.text = pets[Incrementador.index].infoPet

    }
    
    func resetCard() {
        UIView.animate(withDuration: 0.2, animations: {
            self.cardView.alpha = 1
            self.cardView.transform = .identity
            self.cardView.center = self.view.center
            self.thumbImageView.alpha = 0
            self.fotoPet.image = self.images[0]
            self.titulo.text = self.pets[0].nome
            self.subtitulo.text = self.pets[0].infoPet
        })
    }
}
