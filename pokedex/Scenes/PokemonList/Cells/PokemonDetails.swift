//
//  PokemonDetails.swift
//  pokedex
//
//  Created by Juliana Prado on 15/10/22.
//

import Foundation
import UIKit

class PokemonDetails: UIView {
    
    lazy var pokemonID: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .left
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pokemonName: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .left
        label.sizeToFit()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Pokemon Type
    
    lazy var pokemonType: PokemonTypeView = {
        let pkmn = PokemonTypeView()
        pkmn.translatesAutoresizingMaskIntoConstraints = false
        return pkmn
    }()
    
    lazy var pokemonType2: PokemonTypeView = {
        let pkmn = PokemonTypeView()
        pkmn.translatesAutoresizingMaskIntoConstraints = false
        return pkmn
    }()
    
    // MARK: Stack Views
    lazy var pokemonTypeStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.backgroundColor = .clear
        stack.alignment = .leading
        stack.spacing = 3
        return stack
    }()
    
    init(){
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokemonDetails: UIViewLayout{
   
    func setupHierarchy() {
        self.addSubview(pokemonID)
        self.addSubview(pokemonName)
    
        ///stack with icon and label and background
        pokemonTypeStack.addArrangedSubview(pokemonType)
        pokemonTypeStack.addArrangedSubview(pokemonType2)
        self.addSubview(pokemonTypeStack)
        
    }
    
    func setupConstraints() {
        pokemonID.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pokemonID.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        pokemonName.topAnchor.constraint(equalTo: pokemonID.bottomAnchor).isActive = true
        pokemonName.heightAnchor.constraint(equalToConstant: 35).isActive = true
                       
        pokemonTypeStack.topAnchor.constraint(equalTo: pokemonName.bottomAnchor).isActive = true
        pokemonTypeStack.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
       
    }
    
    func setupViews() {
        pokemonType2.iconContainer.image?.withTintColor(.white)
    }
    
    
}
