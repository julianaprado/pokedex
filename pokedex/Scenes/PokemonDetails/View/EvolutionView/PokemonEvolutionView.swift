//
//  PokemonEvolutionView.swift
//  pokedex
//
//  Created by Juliana Prado on 18/10/22.
//

import Foundation
import UIKit

class PokemonEvolutionView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokemonEvolutionView: UIViewLayout {
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupViews() {
        
    }
    
}
