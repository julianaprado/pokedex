//
//  PokemonTypeView.swift
//  pokedex
//
//  Created by Juliana Prado on 15/10/22.
//

import Foundation
import UIKit

class PokemonTypeView: UIView {
    
    lazy var pokemonTypeLabel : UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .white
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var iconContainer: UIImageView = {
        let container = UIImageView()
        container.backgroundColor = .clear
        container.translatesAutoresizingMaskIntoConstraints = false
        container.clipsToBounds = true
        container.layer.cornerRadius = 5
        container.layer.masksToBounds = true
        return container
    }()
    
    lazy var rectangleView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()
    
    init(){
        super.init(frame: .zero)
        iconContainer.image?.withTintColor(.white)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

extension PokemonTypeView: UIViewLayout {
    
    func setupHierarchy() {
        self.addSubview(iconContainer)
        
        rectangleView.addSubview(iconContainer)
        rectangleView.addSubview(pokemonTypeLabel)
        self.addSubview(rectangleView)
        
        
        
    }
    
    func setupConstraints() {
        rectangleView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rectangleView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        iconContainer.leftAnchor.constraint(equalTo: rectangleView.leftAnchor, constant: 5).isActive = true
        iconContainer.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iconContainer.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconContainer.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor).isActive = true
        
        pokemonTypeLabel.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor).isActive = true
        pokemonTypeLabel.leftAnchor.constraint(equalTo: iconContainer.rightAnchor, constant: 5).isActive = true
        
    }
    
    func setupViews() {
        rectangleView.layer.cornerRadius = 12
    }
    
    
}
