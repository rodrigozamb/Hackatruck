//
//  ViewModel.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    
    @Published var estacionamentos: [Estacionamento] = []
   

    
    func fetchEstacionamentos(){
        guard let url = URL(string: "http://127.0.0.1:1880/cars") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Estacionamento].self, from: data)
                
                DispatchQueue.main.async {
                    self?.estacionamentos = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
   
    
}
