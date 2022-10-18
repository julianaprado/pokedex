//
//  AbilityEntry.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation

struct AbilityEntry: Decodable {
    let effectEntries: [Effect]
    
    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
    }
}

struct Effect: Decodable {
    let effect: String
    let language: Language
    
    enum CodingKeys: String, CodingKey {
        case effect
        case language
    }
}

struct Language: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
