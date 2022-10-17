//
//  PokemonListViewModel.swift
//  pokedex
//
//  Created by Juliana Prado on 14/10/22.
//

import Foundation
import UIKit

class PokemonListViewModel: NSObject {
    
    weak var viewController: PokemonListViewController?
    var results : [Pokemon] = []
    var pokemons: [IndividualPokemon] = []
    var apiStatus = State.loading {
        didSet{
            DispatchQueue.main.async {
                self.view.collectionView.reloadData()
            }
        }
    }
    
    private let view = PokemonListView()
    
    init(viewController: PokemonListViewController){
        self.viewController = viewController
        super.init()
        
        self.viewController?.viewModelDelegate = self
        self.view.collectionView.delegate = self
        self.view.collectionView.dataSource = self
        
        
    }
    
    func getView() -> PokemonListView{
        return self.view
    }
    
    func fectchData(){
        PokedexApiManager.shared.searchResults{ [self] results in
            self.results = results
            fetchPokemons()
        }
    }
    
    func fetchPokemons(){
        let dispatchGroup = DispatchGroup()
            for pokemon in self.results {
                dispatchGroup.enter()
                PokedexApiManager.shared.fetchPokemon(url: pokemon.url) { [self] individualPokemon in
                    self.pokemons.append(individualPokemon)
                    dispatchGroup.leave()
                }
               
            }
        dispatchGroup.notify(queue: .main) {
            print(self.pokemons)
            self.apiStatus = .loaded
        }
        
    }
    
    func capitalizingFirstLetter(name: String) -> String {
        return name.prefix(1).uppercased() + name.lowercased().dropFirst()
    }
    
    func applyMaskToPokemonId(with id: Int) -> String {
        let idAsString = String(id)
        let mask = "#000"
        return mask.dropLast(idAsString.count) + idAsString
    }
    
}
 
extension PokemonListViewModel: PokemonListViewModelDelegate {

}


extension PokemonListViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return pokemons.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.view.collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell
        let pokemon = pokemons[indexPath.row]
        cell?.setupCell(pokemonType: pokemon.types,
                        pokemonId: applyMaskToPokemonId(with: pokemon.id),
                        pokemonName: capitalizingFirstLetter(name: pokemon.name)
        )
        PokedexApiManager.shared.fetchPokemonImage(url: pokemon.sprites.other.officialArtwork.frontDefault) { data in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell?.imageView.image = image
                }
            }
        }
            return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.collectionView.bounds.width, height: 150)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

