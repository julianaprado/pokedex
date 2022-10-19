//
//  Stats.swift
//  pokedex
//
//  Created by Juliana Prado on 18/10/22.
//

import Foundation

struct Stats: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct Stat: Decodable {
    
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
}
