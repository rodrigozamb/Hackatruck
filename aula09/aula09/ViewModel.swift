//
//  ViewModel.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    
    @Published var houses: [House] = []
    @Published var characters: [Character] = []
    @Published var houseCharacters: [Character] = []
    
    @Published var founderCharacter: Character?
    @Published var lordCharacter: Character?
    
    //if(lordCharacter != nil)
    
    func fetchFounderCharacter(personURL: String){
        guard let url = URL(string: personURL) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Character.self, from: data)
                
                DispatchQueue.main.async {
                    self?.founderCharacter = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchLordCharacter(personURL: String){
        guard let url = URL(string: personURL) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Character.self, from: data)
                
                DispatchQueue.main.async {
                    self?.lordCharacter = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    
    
    func fetchHouses(){
        guard let url = URL(string: "https://anapioficeandfire.com/api/houses") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([House].self, from: data)
                
                DispatchQueue.main.async {
                    self?.houses = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchCharacters( ){
        guard let url = URL(string: "https://anapioficeandfire.com/api/characters") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Character].self, from: data)
                
                DispatchQueue.main.async {
                    self?.characters = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchHouseCharacters(urls:[String]){
        
        let urlArray = urls.compactMap{ URL(string: $0) }
        print(urlArray)
        for url in urlArray{
            
            let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                
                do {
                    let parsed = try JSONDecoder().decode(Character.self, from: data)
                    
                    DispatchQueue.main.async {
                        self?.houseCharacters.append(parsed)
                        print(self!.houseCharacters.count)
                    }
                }catch{
                    print(error)
                }
            }
            task.resume()
            
        }
        
        print("HOUSE CHARACTERS!!!")
        print(self.houseCharacters.count)
    }
    
    func clearHouseCharactersArray(){
        self.houseCharacters = []
    }
    
}
