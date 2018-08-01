//
//  PerfilViewController.swift
//  takemehome
//
//  Created by student on 31/07/18.
//  Copyright © 2018 juan. All rights reserved.
//

import UIKit

class InfoPetViewController: UIViewController {

    @IBOutlet weak var endereco: UILabel!
    @IBOutlet weak var contatoDoador: UILabel!
    @IBOutlet weak var infoPet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pets : [Pet] = PetResource.getPet()
        
        endereco.text = pets[0].endereco
        contatoDoador.text = pets[0].contato
        infoPet.text = pets[0].infoPet
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
