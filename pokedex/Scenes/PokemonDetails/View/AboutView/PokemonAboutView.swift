//
//  PokemonAboutView.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonAboutView: UIView {

    weak var modalDelegate: ModalDelegate?
    var ability: [Ability] = []
    
    lazy var pokedexData: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Pokedex Data"
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var trainingData: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Training Data"
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pokemonDescription: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var speciesStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var weightStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var heightStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var pokedexAbilities: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Abilities"
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var abilityOne: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var abilityTwo: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var baseExp: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var growthRate: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var catchRate: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.modalAbilityOne))
        abilityOne.addGestureRecognizer(tapGesture)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(self.modalAbilityTwo))
        abilityTwo.addGestureRecognizer(tapGesture2)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAbout(pokemon: IndividualPokemon, species: PokemonSpecies){
        self.ability = pokemon.abilities
        for s in species.flavorTextEntries {
            if s.language.name == "en"{
                let text = s.flavorText.replacingOccurrences(of: "\n", with: " ")
                pokemonDescription.text  = text.replacingOccurrences(of: "\u{000c}", with: " ")
                break
            }
        }
        
        
        let pokemonTypeProperties = PokemonPropertiesFunctions.setTypeComponents(withType: pokemon.types[0].type.name)
        
        pokedexData.textColor = pokemonTypeProperties.0
        pokedexAbilities.textColor = pokemonTypeProperties.0
        trainingData.textColor = pokemonTypeProperties.0
        
        speciesStat.statLabel.text = "Species"
        if species.eggGroups.count == 2 {
            speciesStat.statValueLabel.text = PokemonPropertiesFunctions.capitalizingFirstLetter(name: species.eggGroups[1].name)
        } else {
            speciesStat.statValueLabel.text = PokemonPropertiesFunctions.capitalizingFirstLetter(name: species.eggGroups[0].name)
        }
        
        weightStat.statLabel.text = "Weight"
        weightStat.statValueLabel.text = String(pokemon.weight) + " kg"
        
        heightStat.statLabel.text = "Height"
        heightStat.statValueLabel.text = String(pokemon.height) + " cm"
        
        abilityOne.statLabel.text = "Ability"
        abilityOne.statValueLabel.text = PokemonPropertiesFunctions.capitalizingFirstLetter(name: pokemon.abilities[0].ability.name)
        abilityOne.statValueLabel.textColor = pokemonTypeProperties.2
        
        if pokemon.abilities.count > 1 {
            abilityTwo.statLabel.text = "Hidden Ability"
            abilityTwo.statValueLabel.text = PokemonPropertiesFunctions.capitalizingFirstLetter(name: pokemon.abilities[1].ability.name)
            abilityTwo.statValueLabel.textColor = pokemonTypeProperties.2
        }
        
        catchRate.statLabel.text = "Catch Rate"
        catchRate.statValueLabel.text = String(species.captureRate)
        
        baseExp.statLabel.text = "Base Experience"
        baseExp.statValueLabel.text = String(pokemon.baseExperience)
        
        growthRate.statLabel.text = "Growth Rate"
        growthRate.statValueLabel.text = species.growthRate.name

    }
 
    @objc
    func modalAbilityOne(){
        self.modalDelegate?.showModal(ability: self.ability[0].ability)
    }
    
    @objc
    func modalAbilityTwo(){
        self.modalDelegate?.showModal(ability: self.ability[1].ability)
    }
    
}

extension PokemonAboutView: UIViewLayout {
   
    func setupHierarchy() {
        addSubview(pokemonDescription)
        
        addSubview(pokedexData)
        addSubview(speciesStat)
        addSubview(weightStat)
        addSubview(heightStat)
        
        addSubview(pokedexAbilities)
        addSubview(abilityOne)
        addSubview(abilityTwo)
        
        addSubview(trainingData)
        addSubview(catchRate)
        addSubview(baseExp)
        addSubview(growthRate)
    }
    
    func setupConstraints() {
        pokemonDescription.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        pokemonDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true

        pokemonDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        pokedexData.topAnchor.constraint(equalTo: pokemonDescription.bottomAnchor, constant: 20).isActive = true
        pokedexData.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        speciesStat.topAnchor.constraint(equalTo: pokedexData.bottomAnchor, constant: 22).isActive = true
        speciesStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        speciesStat.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        speciesStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
        weightStat.topAnchor.constraint(equalTo: speciesStat.bottomAnchor, constant: 10).isActive = true
        weightStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        weightStat.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        weightStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
        heightStat.topAnchor.constraint(equalTo: weightStat.bottomAnchor, constant: 10).isActive = true
        heightStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        heightStat.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        heightStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
        pokedexAbilities.topAnchor.constraint(equalTo: heightStat.bottomAnchor, constant: 20).isActive = true
        pokedexAbilities.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        
        abilityOne.topAnchor.constraint(equalTo: pokedexAbilities.bottomAnchor, constant: 22).isActive = true
        abilityOne.heightAnchor.constraint(equalToConstant: 20).isActive = true
        abilityOne.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        abilityOne.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
        abilityTwo.topAnchor.constraint(equalTo: abilityOne.bottomAnchor, constant: 10).isActive = true
        abilityTwo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        abilityTwo.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        abilityTwo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
        trainingData.topAnchor.constraint(equalTo: abilityTwo.bottomAnchor, constant: 20).isActive = true
        trainingData.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        
        catchRate.topAnchor.constraint(equalTo: trainingData.bottomAnchor, constant: 20).isActive = true
        catchRate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        catchRate.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        catchRate.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
        baseExp.topAnchor.constraint(equalTo: catchRate.bottomAnchor, constant: 10).isActive = true
        baseExp.heightAnchor.constraint(equalToConstant: 20).isActive = true
        baseExp.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        baseExp.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true

        growthRate.topAnchor.constraint(equalTo: baseExp.bottomAnchor, constant: 10).isActive = true
        growthRate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        growthRate.leftAnchor.constraint(equalTo: pokedexData.leftAnchor).isActive = true
        growthRate.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -70).isActive = true
        
    }
    
    func setupViews() {
        
    }
    
    
}
