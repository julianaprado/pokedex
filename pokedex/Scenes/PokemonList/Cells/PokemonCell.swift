//
//  CollectionViewCells.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation
import UIKit

class PokemonCell: UICollectionViewCell{
    
    //MARK: - Properties
    static let identifier = StringConstants.pokemonListCellReusibleIdentifier
    
    lazy var backgroundColorView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var pokemonDetails: PokemonDetails = {
        let details = PokemonDetails()
        details.translatesAutoresizingMaskIntoConstraints = false
        return details
    }()
    
    
    
    ///Function called inside prepare for reuse
    var onReuse: () -> Void = {}
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Collection View Delegate Function
    override func prepareForReuse() {
        super.prepareForReuse()
        onReuse()
        imageView.image = nil

        pokemonDetails.pokemonType.iconContainer.image = nil
        pokemonDetails.pokemonType.pokemonTypeLabel.text = ""
        pokemonDetails.pokemonType.rectangleView.frame = .zero

        pokemonDetails.pokemonType2.iconContainer.image = nil
        pokemonDetails.pokemonType2.pokemonTypeLabel.text = ""
        pokemonDetails.pokemonType2.rectangleView.frame = .zero

        pokemonDetails.pokemonType.rectangleView.backgroundColor = .clear
        pokemonDetails.pokemonType2.rectangleView.backgroundColor = .clear
        
    }
    
    func setupCell(pokemonType: [PokemonTypes], pokemonId: String, pokemonName: String){
        pokemonDetails.pokemonName.text = pokemonName
        pokemonDetails.pokemonID.text = pokemonId
        prepareCellForPokemon(ofTypes: pokemonType)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        pokemonDetails.updateConstraints()
        pokemonDetails.pokemonType.rectangleView.updateConstraints()
        pokemonDetails.pokemonType2.rectangleView.updateConstraints()
        pokemonDetails.pokemonType.pokemonTypeLabel.updateConstraints()
        pokemonDetails.pokemonType2.pokemonTypeLabel.updateConstraints()
    }
    
}

extension PokemonCell: UIViewLayout {
    
    func setupHierarchy() {
        self.addSubview(backgroundColorView)
        self.addSubview(imageView)
        backgroundColorView.addSubview(pokemonDetails)
    }
    
    func setupConstraints() {
        backgroundColorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        backgroundColorView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        backgroundColorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive =  true
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 85).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        pokemonDetails.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        pokemonDetails.centerYAnchor.constraint(equalTo: self.backgroundColorView.centerYAnchor).isActive = true
        pokemonDetails.heightAnchor.constraint(equalToConstant: 100).isActive = true
        pokemonDetails.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5 ).isActive = true
        
    }
    
    func setupViews() {
        self.backgroundColorView.layer.cornerRadius = 22
    }
    
    
}

extension PokemonCell {
    
    func prepareCellForPokemon(ofTypes types: [PokemonTypes]) {
        if types.count == 1 {
            pokemonDetails.pokemonType2.iconContainer.image = nil
            pokemonDetails.pokemonType2.pokemonTypeLabel.text = ""
            pokemonDetails.pokemonType2.rectangleView.frame = .zero
            let pokemonTypeProperties = PokemonPropertiesFunctions.setTypeComponents(withType: types[0].type.name)
            pokemonDetails.pokemonType.rectangleView.backgroundColor = pokemonTypeProperties.2
            pokemonDetails.pokemonType.iconContainer.image = pokemonTypeProperties.1
            pokemonDetails.pokemonType.pokemonTypeLabel.text = types[0].type.name
            backgroundColorView.backgroundColor = pokemonTypeProperties.0
        } else {
            let pokemonTypeProperties = PokemonPropertiesFunctions.setTypeComponents(withType: types[0].type.name)
            pokemonDetails.pokemonType.rectangleView.backgroundColor = pokemonTypeProperties.2
            pokemonDetails.pokemonType.iconContainer.image = pokemonTypeProperties.1
            pokemonDetails.pokemonType.pokemonTypeLabel.text = types[0].type.name
            backgroundColorView.backgroundColor = pokemonTypeProperties.0
            
            let pokemonTypeProperties2 = PokemonPropertiesFunctions.setTypeComponents(withType: types[1].type.name)
            pokemonDetails.pokemonType2.rectangleView.backgroundColor = pokemonTypeProperties2.2
            pokemonDetails.pokemonType2.iconContainer.image = pokemonTypeProperties2.1
            pokemonDetails.pokemonType2.pokemonTypeLabel.text = types[1].type.name
        }
    }
    
}
