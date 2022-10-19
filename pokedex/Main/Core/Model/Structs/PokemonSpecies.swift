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
    let captureRate: Int
    let growthRate: GrowthRate
    
    enum CodingKeys: String, CodingKey{
        case eggGroups = "egg_groups"
        case flavorTextEntries = "flavor_text_entries"
        case shape
        case captureRate = "capture_rate"
        case growthRate = "growth_rate"
    }
    
}

struct GrowthRate: Decodable {
    
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case name
    }
}
