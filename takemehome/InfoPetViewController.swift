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
        AdotanteDAO.getFrequencia { (adotantes) in
            self.contatoDoador.text = adotantes[0].nome
            self.endereco.text = adotantes[0].sexo
            self.infoPet.text = adotantes[0].idade
        // Do any additional setup after loading the view.
        }

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
