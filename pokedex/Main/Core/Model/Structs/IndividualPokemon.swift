//
//  IndividualPokemon.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation

struct IndividualPokemon: Decodable, Hashable {
    
    let abilities: [Ability]
    let height: Int
    let weight: Int
    let name: String
    let types: [PokemonTypes]
    let sprites: PkmnImage
    let id: Int
    let species: Specie
    let stats: [Stats]
    let baseExperience: Int
    
    enum CodingKeys: String, CodingKey{
        case abilities
        case height
        case weight
        case name
        case types
        case sprites
        case id
        case species
        case stats
        case baseExperience = "base_experience"
    }
    
    static func == (lhs: IndividualPokemon, rhs: IndividualPokemon) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

