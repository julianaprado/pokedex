//
//  PokemonType.swift
//  pokedex
//
//  Created by Juliana Prado on 15/10/22.
//

import Foundation


struct PokemonType: Decodable {
    
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
