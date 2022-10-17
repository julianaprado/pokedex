//
//  LoadingState.swift
//  pokedex
//
//  Created by Juliana Prado on 13/10/22.
//

import Foundation

enum State {
    case loading
    case failed(Error)
    case loaded
    case pokemonFinished
}


