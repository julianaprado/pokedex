//
//  Results.swift
//  pokedex
//
//  Created by Juliana Prado on 13/10/22.
//

import Foundation

struct Results: Decodable {
   
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
    
    enum CodingKeys: String, CodingKey{
        case count
        case next
        case previous
        case results
    }
}
