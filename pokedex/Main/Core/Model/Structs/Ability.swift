//
//  Ability.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation

struct Ability: Decodable {
    let isHidden: Bool
    let slot: Int
    let ability: AbilityInfo
    
    enum CodingKeys: String, CodingKey{
        case isHidden = "is_hidden"
        case slot
        case ability
    }
}

struct AbilityInfo: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
