//
//  PokemonType.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation

struct PokemonTypes: Decodable{
    let slot: Int
    let type: PokemonType
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}

