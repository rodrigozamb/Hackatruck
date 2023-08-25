//
//  APIModels.swift
//  aula12
//
//  Created by Student25 on 09/08/23.
//

import Foundation

struct Carro: Decodable, Hashable{

    let modelo: String?
    let ano: Int?
    let cor: String?
    let preco: Double?
}

struct Estacionamento: Decodable, Hashable{
    let nomeEstacionamento: String?
    let endereco: String?
    let vaga: Int?
    let carro: [Carro]?
}
