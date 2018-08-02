//
//  SeuPetViewController.swift
//  takemehome
//
//  Created by student on 02/08/18.
//  Copyright © 2018 juan. All rights reserved.
//

import UIKit


class SeuPetViewController: UIViewController {
    
    
    @IBOutlet weak var labelBatimento: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func button(_ sender: Any) {
        FrequenciaDAO.getFrequencia { (frequencia) in
            self.labelBatimento.text = frequencia.batimento
        }
    }
}
