//
//  PokemonDetailsCell.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonDetailsCell: UICollectionViewCell{
    
    //MARK: - Properties
    static let identifier = StringConstants.pokemonDetailsCellReusibleIdentifier
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
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
    }
}

extension PokemonDetailsCell: UIViewLayout{
    
    func setupHierarchy() {
        addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func setupViews() {
        
    }
    
    
}
