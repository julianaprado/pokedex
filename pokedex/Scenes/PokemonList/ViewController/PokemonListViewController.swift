//
//  PokemonListViewController.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class PokemonListViewController: UIViewController {
    
    weak var coordinator: PokemonListCoordinator?
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .blue
    }
    
}
