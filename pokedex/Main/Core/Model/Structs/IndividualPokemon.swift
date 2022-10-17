//
//  IndividualPokemon.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation

struct IndividualPokemon: Decodable {
    let abilities: [Ability]
    let height: Int
    let weight: Int
    let name: String
    let types: [PokemonTypes]
    let sprites: PkmnImage
    let id: Int
    
    enum CodingKeys: String, CodingKey{
        case abilities
        case height
        case weight
        case name
        case types
        case sprites
        case id
    }
    
}

