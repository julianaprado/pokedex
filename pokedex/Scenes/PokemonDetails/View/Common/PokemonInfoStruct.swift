//
//  PokemonStatsView.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonInfoStruct: UIView {
    
    lazy var statLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        label.textColor = .black
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .gray
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Stack Views
    lazy var statsStack: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        stack.alignment = .leading
        stack.spacing = 10
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

extension PokemonInfoStruct: UIViewLayout {
    
    func setupHierarchy() {
        statsStack.addArrangedSubview(statLabel)
        statsStack.addArrangedSubview(statValueLabel)
        self.addSubview(statsStack)
        
    }
    
    func setupConstraints() {
        statsStack.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        statsStack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        statsStack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func setupViews() {
        
    }
    
    
}
