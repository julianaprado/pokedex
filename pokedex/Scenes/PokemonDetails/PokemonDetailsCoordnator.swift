//
//  PokemonDetailsCoordnator.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonDetailsCoordnator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var children: [Coordinator] = []
    
    var nav: UINavigationController
    
    init(navigationController nv: UINavigationController){
        self.nav = nv
    }
    
    func start(pokemon: IndividualPokemon) {
        let vc = PokemonDetailsViewController(pokemon: pokemon)
        nav.navigationItem.hidesBackButton = true
        vc.coordinator = self
        nav.present(vc, animated: true)
    }
    
    func start(){
        
    }
    
    func finish() {
        
    }
    
    
}
