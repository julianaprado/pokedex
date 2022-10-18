//
//  FlavorTextEntries.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation

struct FlavorTextEntries: Decodable {
    let flavorText: String
    let language: pkmnLanguage
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language
    }
    
}

struct pkmnLanguage: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
