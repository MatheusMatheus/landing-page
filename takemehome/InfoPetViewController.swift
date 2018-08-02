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
        
        enderecoPet.text = pets[0].endereco
        contatoDoador.text = pets[0].contato
        sexoPet.text = pets[0].sexo
        portePet.text = pets[0].porte
        infoPet.text = pets[0].infoPet
        
     
    }
}
