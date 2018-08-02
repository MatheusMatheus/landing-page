//
//  SensorCardiacoDAO.swift
//  takemehome
//
//  Created by student on 02/08/18.
//  Copyright © 2018 juan. All rights reserved.
//

import Foundation


class Frequencia {
    var batimento : String
    
    init(json: [String: AnyObject]) {
        let payload = json["payload"] as! [String: AnyObject]
        let d = payload["d"] as! [AnyObject]
        self.batimento = String(d[0]["batimento"] as! Float)
    }
}


class FrequenciaDAO {
    
    static func getFrequencia (callback: @escaping ((Frequencia) -> Void)) {
        
        let endpoint: String = "https://botelhocardiaco.mybluemix.net/ultimo"
        
        guard let url = URL(string: endpoint) else {
            print("Erro: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Erro = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]  {
                        
                        let frequencia = Frequencia(json: json)
                        
                        print("Batimento puxado: \(frequencia.batimento)")
                        
                        callback(frequencia)
                        
                    }else {
                        print("Crash!")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
        })
        task.resume()
    }
}
