//
//  LoadingProtocol.swift
//  pokedex
//
//  Created by Juliana Prado on 13/10/22.
//

import Foundation

protocol LoadingProtocol: AnyObject {
    func finishedLoadingPokedex(status: State)
    func getPokemon()
}
