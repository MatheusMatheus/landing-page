//
//  Animal.swift
//  takemehome
//
//  Created by student on 27/07/18.
//  Copyright © 2018 juan. All rights reserved.
//

import Foundation

class Pet {
    var id : String
    var rev : String
    var nome : String
    var idade: String
    var porte : String
    var sexo : String
    var categoria: String
    var contato: String
    var endereco: String
    var infoPet: String
    var doador: Doador
    
    init(json: [String: Any]) {
        
        id = json["_id"] as! String
        rev = json["_rev"] as! String
        nome = json["nome"] as! String
        idade = json["idade"] as! String
        porte = json["porte"] as! String
        sexo = json["sexo"] as! String
        endereco = json["endereco"] as! String
        categoria = json["categoria"] as! String
        contato = json["contato"] as! String
        infoPet = json["infoPet"] as! String
        self.doador = Doador(json: json["doador"] as! [String : String])
   
    }
}

/*
class Animal {
    var id : String
    var rev : String
    var nome : String
    var idade: String
    var porte : String
    var sexo : String
    
    init(json: [String: String]) {
        id = json["_id"]!
        rev = json["_rev"]!
        nome = json["nome"]!
        idade = json["idade"]!
        porte = json["porte"]!
        sexo = json["sexo"]!
    }
    
    init(json: [String: String]) {
        self.id = json["id"] ?? "0"
        self.nome = json["nome"] ?? ""
        self.idade = json["idade"] ?? "0"
        self.porte = json["porte"] ?? ""
        self.sexo = json["sexo"] ?? ""
        self.endereco = json["endereco"] ?? ""
        self.sensor = [Sensor]()
        
        
        if let batimentos = json["batimentos"] as? [ [String: AnyObject] ] {
            for jsonBatimento in batimentos {
                let sensor = Sensor(json: jsonBatimento)
                
                self.sensor.append(sensor)
            }
        }
    }
 
}

class Sensor {
    var deviceID: String
    var deviceType: String
    var batimento: Double
    
    init(json: [String: AnyObject]) {
        self.deviceID = json["deviceId"] as? String ?? ""
        self.deviceType = json["deviceType"] as? String ?? ""
        self.batimento = 0.0
        if let payload = json["payload"] as? [String: Double] {
            self.batimento = payload["d"] ?? 0.0
        }
    }
}


class Cachorro: Animal {
    
}

class  Gato: Animal {
    
}
*/
