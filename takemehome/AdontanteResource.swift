//
//  PuxaDados.swift
//  BancoDeDados
//
//  Created by student on 31/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation



class AdotanteResource {
    
    static func getFrequencia (callback: @escaping (([Adotante]) -> Void)) {
        
        let endpoint: String = "https://botelhocardiaco.mybluemix.net/adotantes"
        
        guard let url = URL(string: endpoint) else {
            print("Erroooo: Cannot create URL")
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
                        
                        print("quantidades de adotantes \(adotantes.count)")
                        
                        callback(adotantes)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
    }
    
    
}
