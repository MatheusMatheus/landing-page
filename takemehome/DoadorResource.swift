//
//  PuxaDados.swift
//  BancoDeDados
//
//  Created by student on 31/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation



class DoadorResource {
    
    
    static func getDoador() -> [Doador]{
        
        let url = URL(string: "https://botelhocardiaco.mybluemix.net/doadores")!
        
        let(data,_, error) = URLSession.shared.synchronousDataTask(with: url)
        
        
        if error != nil{
            return []
        } else {
            let json = try!
                JSONSerialization.jsonObject(with: data!,options: []) as![[String: String]]
            var doadores = [Doador]()
            for obj in json {
                let pet = Doador(json: obj)
                doadores.append(pet)
            }
            
            print("quantidades de pets puxados \(doadores.count)")
            return doadores
        }
    }
    
    
}
