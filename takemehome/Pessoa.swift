//
//  Pessoa.swift
//  takemehome
//
//  Created by student on 27/07/18.
//  Copyright © 2018 juan. All rights reserved.
//

import Foundation


class Doador{
    var nome : String
    var idade: String
    var sexo : String
    
    init(json: [String: String]) {
        nome = json["nome"]!
        idade = json["idade"]!
        sexo = json["sexo"]!
    }
    
    
}

class Adotante {
    var nome : String
    var idade: String
    var sexo : String
    
    init(json: [String: String]) {
        nome = json["nome"]!
        idade = json["idade"]!
        sexo = json["sexo"]!
    }
}





