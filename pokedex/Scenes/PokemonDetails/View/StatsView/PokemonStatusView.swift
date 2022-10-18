//
//  PokemonStatusView.swift
//  pokedex
//
//  Created by Juliana Prado on 18/10/22.
//

import Foundation
import UIKit

class PokemonStatusView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokemonStatusView: UIViewLayout {
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupViews() {
        
    }
    
}
