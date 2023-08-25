//
//  APIModels.swift
//  aula09
//
//  Created by Student25 on 04/08/23.
//

import Foundation


struct House: Decodable, Hashable {
    let url: String?
    let name: String?
    let region: String?
    let coatOfArms: String?
    let words: String?
    let titles: [String]?
    let seats: [String]?
    let currentLord: String?
    let heir: String?
    let overlord: String?
    let founded: String?
    let founder: String?
    let diedOut: String?
    let ancestralWeapons: [String]?
    let cadetBranches: [String]?
    let swornMembers: [String]?
}

struct Character: Decodable, Hashable {
    let url: String?
    let name: String?
    let gender: String?
    let culture: String?
    let born: String?
    let died: String?
    let titles: [String]?
    let aliases: [String]?
    let father: String?
    let mother: String?
    let spouse: String?
    let allegiance: [String]?
    let books: [String]?
    let povBooks:[ String]?
    let tvSeries: [String]?
    let played: [String]?
}

struct HouseInfos{
    let name: String
    let region: String
    let overlord: String
    let founder: String
    let founded: String
    let diedUp: String?
    let members: [String]?
    
    
}
