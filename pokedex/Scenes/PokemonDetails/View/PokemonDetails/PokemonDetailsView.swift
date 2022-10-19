//
//  PokemonDetailsView.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonDetailsView: UIView {

    private var pokemon: IndividualPokemon?
    private var pokemonColor: UIColor?
    private var species: PokemonSpecies?
    
    lazy var collectionView: UICollectionView = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        let compositionalLayout = UICollectionViewCompositionalLayout(section: layoutSection)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
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
    
    lazy var pokemonStatusView: PokemonStatsView = {
        let view = PokemonStatsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pokemonEvolutionView: PokemonEvolutionView = {
        let view = PokemonEvolutionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    lazy var about: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = .white
        label.text = "About"
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var stats: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.text = "Stats"
        label.textColor = .lightWhite
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var evolution: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.text = "Evolution"
        label.textColor = .lightWhite
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        let openStats = UITapGestureRecognizer(target: self, action: #selector(self.openStats))
        stats.addGestureRecognizer(openStats)
        let openAbout = UITapGestureRecognizer(target: self, action: #selector(self.openAbout))
        about.addGestureRecognizer(openAbout)
        let openEvolution = UITapGestureRecognizer(target: self, action: #selector(self.openEvolution))
        evolution.addGestureRecognizer(openEvolution)
        
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPokemonDetails(pokemon: IndividualPokemon, species: PokemonSpecies){
        self.pokemon = pokemon
        self.species = species
        self.pokemonAboutView.setupAbout(pokemon: pokemon, species: species)
        let pokemonType = pokemon.types
        let pokemonTypeOneProperties = PokemonPropertiesFunctions.setTypeComponents(withType: pokemonType[0].type.name)
        self.pokemonColor = pokemonTypeOneProperties.0
        
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
    
    @objc
    func openStats(){
        dimLabels()
        guard let pokemon = self.pokemon, let species = self.species, let pokemonColor = self.pokemonColor else { return }
        pokemonStatusView.setupStats(pokemon: pokemon, species: species, pokemonColor: pokemonColor)
        stats.textColor = .white
        removeAllButtonsFromSuperView()
        addSubview(pokemonStatusView)
        setupStats()
    }
    
    @objc
    func openAbout(){
        dimLabels()
        about.textColor = .white
        removeAllButtonsFromSuperView()
        addSubview(pokemonAboutView)
        setupAbout()
    }
    
    @objc
    func openEvolution(){
        dimLabels()
        evolution.textColor = .white
        removeAllButtonsFromSuperView()
        addSubview(pokemonEvolutionView)
        setupEvolution()
    }
    
}

extension PokemonDetailsView: UIViewLayout {
    
    func setupHierarchy() {
        addSubview(collectionView)
        addSubview(about)
        addSubview(stats)
        addSubview(evolution)
        addSubview(pokemonDetails)
        addSubview(pokemonAboutView)
    }
    
    func setupConstraints() {
        collectionView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        about.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10).isActive = true
        about.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 30).isActive = true
        
        stats.topAnchor.constraint(equalTo: about.topAnchor).isActive = true
        stats.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive = true
        
        evolution.topAnchor.constraint(equalTo: about.topAnchor).isActive = true
        evolution.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: -30).isActive = true
        
        pokemonDetails.leftAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        pokemonDetails.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
        pokemonDetails.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor, constant: -70).isActive = true
        
        setupAbout()

    }
    
    func setupViews() {
        pokemonAboutView.clipsToBounds = true
        pokemonAboutView.layer.cornerRadius = 40
        pokemonAboutView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func removeAllButtonsFromSuperView(){
        pokemonAboutView.removeFromSuperview()
        pokemonStatusView.removeFromSuperview()
        pokemonEvolutionView.removeFromSuperview()
    }
    
    func setupAbout(){
        pokemonAboutView.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 10).isActive = true
        pokemonAboutView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        pokemonAboutView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        pokemonAboutView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        pokemonAboutView.clipsToBounds = true
        pokemonAboutView.layer.cornerRadius = 40
        pokemonAboutView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func setupStats(){
        pokemonStatusView.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 10).isActive = true
        pokemonStatusView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        pokemonStatusView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        pokemonStatusView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        pokemonStatusView.clipsToBounds = true
        pokemonStatusView.layer.cornerRadius = 40
        pokemonStatusView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func setupEvolution(){
        pokemonEvolutionView.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 10).isActive = true
        pokemonEvolutionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        pokemonEvolutionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        pokemonEvolutionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        pokemonEvolutionView.clipsToBounds = true
        pokemonEvolutionView.layer.cornerRadius = 40
        pokemonEvolutionView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func dimLabels(){
        about.textColor = .lightWhite
        stats.textColor = .lightWhite
        evolution.textColor = .lightWhite
    }
    
}
