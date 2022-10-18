//
//  PokemonListView.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation
import UIKit

class PokemonListView: UIView{
    
    lazy var pokedex: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Pokédex"
        label.sizeToFit()
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = -40
        return view
    }()
    
    lazy var noPokemonFoundLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "No Pokémon Found."
        label.sizeToFit()
        label.textColor = .clear
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.zPosition = -20
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "Search for Pokémon by name or using the National Pokédex number."
        label.sizeToFit()
        label.textColor = .gray
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchBar: UITextField = {
        let field = UITextField()
        field.clearButtonMode = .never
        field.adjustsFontSizeToFitWidth = true
        field.returnKeyType = .search
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .darkWhite
        return field
    }()
    
    lazy var searchIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var placeholderLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.text = "What Pokémon are you looking for?"
        label.sizeToFit()
        label.textColor = .gray
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.identifier)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        var image = UIImage(systemName: "magnifyingglass")
        image = image?.withTintColor(.black, renderingMode: .alwaysOriginal)
        searchIcon.image = image
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        pokedex.addGestureRecognizer(tapGesture)
        descriptionLabel.addGestureRecognizer(tapGesture)
        backgroundView.addGestureRecognizer(tapGesture)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
        noPokemonFoundLabel.textColor = .clear
    }
    
}

extension PokemonListView:  UIViewLayout {
    
    func setupHierarchy() {
        self.addSubview(backgroundView)
        self.addSubview(noPokemonFoundLabel)
        self.addSubview(collectionView)
        self.addSubview(pokedex)
        self.addSubview(descriptionLabel)
        self.addSubview(searchBar)
        searchBar.addSubview(placeholderLabel)
        searchBar.addSubview(searchIcon)
    }
    
    func setupConstraints() {
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        noPokemonFoundLabel.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor).isActive = true
        noPokemonFoundLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive = true
        
        
        pokedex.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        pokedex.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: pokedex.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
        
        searchBar.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
        searchBar.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        searchIcon.leftAnchor.constraint(equalTo: searchBar.leftAnchor, constant: 20).isActive = true
        searchIcon.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        
        placeholderLabel.leftAnchor.constraint(equalTo: searchIcon.rightAnchor, constant: 20).isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        
        
        collectionView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func setupViews() {
        searchBar.layer.cornerRadius = 22
        
        
        guard let width = searchIcon.image?.size.width else { return }
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: width + 40, height: 0))
        searchBar.leftView = paddingView
        searchBar.leftViewMode = .always
    }
    
    
}
