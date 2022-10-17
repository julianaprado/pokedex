//
//  OfficialArtwork.swift
//  pokedex
//
//  Created by Juliana Prado on 15/10/22.
//

import Foundation

struct OfficialArtwork: Decodable{
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey{
        case frontDefault = "front_default"
    }
}
