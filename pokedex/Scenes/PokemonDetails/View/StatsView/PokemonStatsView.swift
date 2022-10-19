//
//  PokemonStatusView.swift
//  pokedex
//
//  Created by Juliana Prado on 18/10/22.
//

import Foundation
import UIKit

class PokemonStatsView: UIView{
    
    lazy var baseStat: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Base Stats"
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
        label.font = .systemFont(ofSize: 13)
        label.text = StringConstants.pokemonStatsDescription
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hpStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var attackStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var defenseStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var specialAttackStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var specialDefenseStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var speedStat: PokemonInfoStack = {
        var stat = PokemonInfoStack()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStats(pokemon: IndividualPokemon, species: PokemonSpecies, pokemonColor: UIColor){
        baseStat.textColor = pokemonColor
        
        hpStat.statLabel.text = pokemon.stats[0].stat.name
        hpStat.statValueLabel.text = String(pokemon.stats[0].baseStat)
        
        attackStat.statLabel.text = pokemon.stats[1].stat.name
        attackStat.statValueLabel.text = String(pokemon.stats[1].baseStat)
        
        defenseStat.statLabel.text = pokemon.stats[2].stat.name
        defenseStat.statValueLabel.text = String(pokemon.stats[2].baseStat)
        
        specialAttackStat.statLabel.text = pokemon.stats[3].stat.name
        specialAttackStat.statValueLabel.text = String(pokemon.stats[3].baseStat)
        
        specialDefenseStat.statLabel.text = pokemon.stats[4].stat.name
        specialDefenseStat.statValueLabel.text = String(pokemon.stats[4].baseStat)
        
        speedStat.statLabel.text = pokemon.stats[5].stat.name
        speedStat.statValueLabel.text = String(pokemon.stats[5].baseStat)
    }
    
}

extension PokemonStatsView: UIViewLayout {
    
    func setupHierarchy() {
        addSubview(baseStat)
        addSubview(hpStat)
        addSubview(attackStat)
        addSubview(defenseStat)
        addSubview(specialAttackStat)
        addSubview(specialDefenseStat)
        addSubview(speedStat)
        addSubview(pokemonDescription)
    }
    
    func setupConstraints() {
        baseStat.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        baseStat.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        baseStat.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        hpStat.topAnchor.constraint(equalTo: baseStat.bottomAnchor, constant: 30).isActive = true
        hpStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        hpStat.leftAnchor.constraint(equalTo: baseStat.leftAnchor).isActive = true
        hpStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        attackStat.topAnchor.constraint(equalTo: hpStat.bottomAnchor, constant: 10).isActive = true
        attackStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        attackStat.leftAnchor.constraint(equalTo: baseStat.leftAnchor).isActive = true
        attackStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        defenseStat.topAnchor.constraint(equalTo: attackStat.bottomAnchor, constant: 10).isActive = true
        defenseStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        defenseStat.leftAnchor.constraint(equalTo: baseStat.leftAnchor).isActive = true
        defenseStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        specialAttackStat.topAnchor.constraint(equalTo: defenseStat.bottomAnchor, constant: 10).isActive = true
        specialAttackStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        specialAttackStat.leftAnchor.constraint(equalTo: baseStat.leftAnchor).isActive = true
        specialAttackStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        specialDefenseStat.topAnchor.constraint(equalTo: specialAttackStat.bottomAnchor, constant: 30).isActive = true
        specialDefenseStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        specialDefenseStat.leftAnchor.constraint(equalTo: baseStat.leftAnchor).isActive = true
        specialDefenseStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        speedStat.topAnchor.constraint(equalTo: specialDefenseStat.bottomAnchor, constant: 10).isActive = true
        speedStat.heightAnchor.constraint(equalToConstant: 20).isActive = true
        speedStat.leftAnchor.constraint(equalTo: baseStat.leftAnchor).isActive = true
        speedStat.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
        pokemonDescription.topAnchor.constraint(equalTo: speedStat.bottomAnchor, constant: 30).isActive = true
        pokemonDescription.leftAnchor.constraint(equalTo: baseStat.leftAnchor).isActive = true
        pokemonDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
    }
    
    func setupViews() {
        
    }
    
}
