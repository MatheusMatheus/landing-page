//
//  Doacao.swift
//  takemehome
//
//  Created by student on 27/07/18.
//  Copyright © 2018 juan. All rights reserved.
//

import Foundation

class Doacao {
    var adotante: Adotante
    var doador: Doador
    var animal: Pet
    var data: Date
    
    init(adotante: Adotante, doador: Doador, animal: Pet, data: Date) {
        self.adotante = adotante
        self.doador = doador
        self.animal = animal
        self.data = data
    }
    
    func retiraAnimalDB() {
        // Retirar o animal do DB
    }
    
    
}
