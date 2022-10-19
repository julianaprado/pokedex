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
        label.text = "Pokedex Data"
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
    
    lazy var hpStat: PokemonInfoStruct = {
        var stat = PokemonInfoStruct()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var attackStat: PokemonInfoStruct = {
        var stat = PokemonInfoStruct()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var defenseStat: PokemonInfoStruct = {
        var stat = PokemonInfoStruct()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var specialAttackStat: PokemonInfoStruct = {
        var stat = PokemonInfoStruct()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var specialDefenseStat: PokemonInfoStruct = {
        var stat = PokemonInfoStruct()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var speedStat: PokemonInfoStruct = {
        var stat = PokemonInfoStruct()
        stat.translatesAutoresizingMaskIntoConstraints = false
        return stat
    }()
    
    lazy var extraStat: PokemonInfoStruct = {
        var stat = PokemonInfoStruct()
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
    
}

extension PokemonStatsView: UIViewLayout {
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupViews() {
        
    }
    
}
