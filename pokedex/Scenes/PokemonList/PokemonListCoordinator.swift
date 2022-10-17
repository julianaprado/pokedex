//
//  PokemonListCoordinator.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class PokemonListCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var children: [Coordinator] = []
    
    var nav: UINavigationController
    
    init(navigationController nv: UINavigationController){
        self.nav = nv
    }
    
    func start() {
        let vc = PokemonListViewController()
        nav.navigationItem.hidesBackButton = true
        vc.coordinator = self
        nav.pushViewController(vc, animated: false)
    }
    
    func finish() {
        
    }
    
    
}
