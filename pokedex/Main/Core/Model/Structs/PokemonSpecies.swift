//
//  PokemonSpecies.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation

struct PokemonSpecies: Decodable {
    
    let eggGroups: [EggGroups]
    let flavorTextEntries: [FlavorTextEntries]
    let shape: Shape
    
    enum CodingKeys: String, CodingKey{
        case eggGroups = "egg_groups"
        case flavorTextEntries = "flavor_text_entries"
        case shape
    }
    
}
