//
//  EggGroups.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation

struct EggGroups: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
