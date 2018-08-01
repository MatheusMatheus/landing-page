//
//  PuxaDados.swift
//  BancoDeDados
//
//  Created by student on 31/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation

class Adotante {
    var id : String
    var rev : String
    
    var nome : String
    var idade: String
    var sexo : String
    
    init(json: [String: String]) {
        id = json["_id"]!
        rev = json["_rev"]!
        nome = json["nome"]!
        idade = json["idade"]!
        sexo = json["sexo"]!
    }
}

class AdotanteDAO {
    
    static func getFrequencia (callback: @escaping (([Adotante]) -> Void)) {
        
        let endpoint: String = "https://botelhocardiaco.mybluemix.net/adotantes"
        
        guard let url = URL(string: endpoint) else {
            print("Erro: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: String]]  {
                        
                        var adotantes = [Adotante]()
                        for obj in json {
                            let adotante = Adotante(json: obj)
                            adotantes.append(adotante)
                        }
                        
                        print("Quantidade de batimentos puxados: \(adotantes.count)")
                        
                        callback(adotantes)
                        
                    }else {
                        
                        print("Crash!!!")
                    }
                } catch let error as NSError {
                    print("Erro = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
    }
    
    
}
