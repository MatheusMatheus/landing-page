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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pets : [Pet] = PetResource.getPets()
        
        enderecoPet.text = pets[Incrementador.index].endereco
        contatoDoador.text = pets[Incrementador.index].contato
        sexoPet.text = pets[Incrementador.index].sexo
        portePet.text = pets[Incrementador.index].porte
        infoPet.text = pets[Incrementador.index].infoPet
        
     
    }
}
