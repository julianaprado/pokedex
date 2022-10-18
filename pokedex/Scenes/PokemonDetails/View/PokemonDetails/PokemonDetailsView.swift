//
//  PokemonDetailsView.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonDetailsView: UIView {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PokemonDetailsCell.self, forCellWithReuseIdentifier: PokemonDetailsCell.identifier)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    lazy var pokemonDetails: PokemonDetails = {
        let details = PokemonDetails()
        details.translatesAutoresizingMaskIntoConstraints = false
        return details
    }()
    
    lazy var pokemonAboutView: PokemonAboutView = {
        let view = PokemonAboutView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPokemonDetails(pokemon: IndividualPokemon, species: PokemonSpecies){
        self.pokemonAboutView.setupAbout(pokemon: pokemon, species: species)
        let pokemonType = pokemon.types
        let pokemonTypeOneProperties = PokemonPropertiesFunctions.setTypeComponents(withType: pokemonType[0].type.name)
        
        pokemonDetails.pokemonName.text = PokemonPropertiesFunctions.capitalizingFirstLetter(name:  pokemon.name)
        pokemonDetails.pokemonID.text = PokemonPropertiesFunctions.applyMaskToPokemonId(with: pokemon.id)
        
        self.backgroundColor = pokemonTypeOneProperties.0
        if pokemonType.count == 1 {
            pokemonDetails.pokemonType2.iconContainer.image = nil
            pokemonDetails.pokemonType2.pokemonTypeLabel.text = ""
            pokemonDetails.pokemonType2.rectangleView.frame = .zero

            pokemonDetails.pokemonType.rectangleView.backgroundColor = pokemonTypeOneProperties.2
            pokemonDetails.pokemonType.iconContainer.image = pokemonTypeOneProperties.1
            pokemonDetails.pokemonType.pokemonTypeLabel.text = pokemonType[0].type.name
        } else {
            let pokemonTypeTwoProperties = PokemonPropertiesFunctions.setTypeComponents(withType: pokemonType[1].type.name)
            pokemonDetails.pokemonType.rectangleView.backgroundColor = pokemonTypeOneProperties.2
            pokemonDetails.pokemonType.iconContainer.image = pokemonTypeOneProperties.1
            pokemonDetails.pokemonType.pokemonTypeLabel.text = pokemonType[0].type.name
            
            pokemonDetails.pokemonType2.rectangleView.backgroundColor = pokemonTypeTwoProperties.2
            pokemonDetails.pokemonType2.iconContainer.image = pokemonTypeTwoProperties.1
            pokemonDetails.pokemonType2.pokemonTypeLabel.text = pokemonType[1].type.name
        }
    }
    
}

extension PokemonDetailsView: UIViewLayout {
    func setupHierarchy() {
        addSubview(collectionView)
        addSubview(pokemonDetails)
        addSubview(pokemonAboutView)
    }
    
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        pokemonDetails.leftAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        pokemonDetails.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
        pokemonDetails.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor, constant: -70).isActive = true
        
        pokemonAboutView.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        pokemonAboutView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        pokemonAboutView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        pokemonAboutView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    
    func setupViews() {
        pokemonAboutView.clipsToBounds = true
        pokemonAboutView.layer.cornerRadius = 20
        pokemonAboutView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    
}
