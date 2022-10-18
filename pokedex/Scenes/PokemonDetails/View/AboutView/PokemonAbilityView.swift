//
//  PokemonAbilityView.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonAbilityView: UIView {
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.sizeToFit()
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDescription(description: String){
        descriptionLabel.text = description
    }

    
}

extension PokemonAbilityView: UIViewLayout {
    
    func setupHierarchy() {
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func setupViews() {
        
    }
    
    
}
