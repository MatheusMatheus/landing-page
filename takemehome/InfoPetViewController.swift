//
//  PerfilViewController.swift
//  takemehome
//
//  Created by student on 31/07/18.
//  Copyright © 2018 juan. All rights reserved.
//

import UIKit

class InfoPetViewController: UIViewController {

    @IBOutlet weak var enderecoPet: UILabel!
    @IBOutlet weak var contatoDoador: UILabel!
    @IBOutlet weak var sexoPet: UILabel!
    @IBOutlet weak var portePet: UILabel!
    @IBOutlet weak var infoPet: UITextView!
    @IBOutlet weak var fotoPet: UIImageView!
    
    let images = [#imageLiteral(resourceName: "foto1"),#imageLiteral(resourceName: "foto2"),#imageLiteral(resourceName: "foto3"),#imageLiteral(resourceName: "foto4"),#imageLiteral(resourceName: "foto5"),#imageLiteral(resourceName: "foto6"),#imageLiteral(resourceName: "foto7"),#imageLiteral(resourceName: "foto8"),#imageLiteral(resourceName: "foto9"),#imageLiteral(resourceName: "foto10")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pets : [Pet] = PetResource.getPets()
        
        enderecoPet.text = pets[Incrementador.index].endereco
        contatoDoador.text = pets[Incrementador.index].contato
        sexoPet.text = pets[Incrementador.index].sexo
        portePet.text = pets[Incrementador.index].porte
        infoPet.text = pets[Incrementador.index].infoPet
        fotoPet.image = images[Incrementador.index]
     
    }
}
