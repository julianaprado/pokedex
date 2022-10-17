//
//  Pokemon.swift
//  pokedex
//
//  Created by Juliana Prado on 13/10/22.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

