//
//  FrontImage.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation

struct Other: Decodable {
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}
