//
//  PuxaDados.swift
//  BancoDeDados
//
//  Created by student on 31/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation



class PetResource {
    
    static func getPet() -> [Pet]{
        
        let url = URL(string: "https://botelhocardiaco.mybluemix.net/animais")!
        
        let(data,_, error) = URLSession.shared.synchronousDataTask(with: url)
        
        
        if error != nil{
            return []
        } else {
            let json = try!
                JSONSerialization.jsonObject(with: data!,options: []) as![[String: AnyObject]]
            var pets = [Pet]()
            for obj in json {
                let pet = Pet(json: obj)
                pets.append(pet)
            }
            
            print("quantidades de pets puxados \(pets.count)")
            return pets
        }
    }
}

