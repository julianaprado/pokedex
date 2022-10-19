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
    var results: Results?
    var pokemons: [IndividualPokemon] = []
    var apiStatus = State.loading {
        didSet{
            DispatchQueue.main.async {
                self.view.collectionView.reloadData()
            }
        }
    }
    var semaphore = false
    
    private let view = PokemonListView()
    
    init(viewController: PokemonListViewController){
        self.viewController = viewController
        super.init()
        
        self.view.collectionView.delegate = self
        self.view.collectionView.dataSource = self
        self.view.searchBar.delegate = self
        self.view.delegate = self
        
        
        
    }
    
    func getView() -> PokemonListView{
        return self.view
    }
    
    func fetchData(){
        PokedexApiManager.shared.getResults{ [weak self] results in
            self?.results = results
            guard let pokemon = self?.results?.results else { return }
            self?.fetchPokemons(results: pokemon)
        }
    }
    
    func fetchPokemons(results: [Pokemon]){
        let dispatchGroup = DispatchGroup()
            for pokemon in results {
                dispatchGroup.enter()
                PokedexApiManager.shared.fetchPokemon(url: pokemon.url) { [weak self] individualPokemon in
                    self?.pokemons.append(individualPokemon)
                    dispatchGroup.leave()
                }
               
            }
        dispatchGroup.notify(queue: .main) {
            self.pokemons = self.pokemons.sorted(by: { $0.id < $1.id })
            self.apiStatus = .loaded
        }
        
    }
    
}
 
extension PokemonListViewModel: PokemonListViewModelDelegate {
    
    func setSearchBar() {
        self.view.placeholderLabel.textColor = .gray
        if pokemons.count <= 1 {
            self.pokemons.removeAll()
            fetchData()
            semaphore = true
        }
    }
    

}


extension PokemonListViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
    }
    
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return pokemons.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.view.collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell
        let pokemon = pokemons[indexPath.row]
        cell?.setupCell(pokemonType: pokemon.types,
                        pokemonId: PokemonPropertiesFunctions.applyMaskToPokemonId(with: pokemon.id),
                        pokemonName: PokemonPropertiesFunctions.capitalizingFirstLetter(name: pokemon.name)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.searchBar.resignFirstResponder()
        self.viewController?.coordinator?.finish(pokemon: self.pokemons[indexPath.row])
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        viewController?.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool){
        viewController?.navigationController?.setNavigationBarHidden(true, animated: true)
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        
        if offsetY > height - scrollView.frame.size.height {
            guard let next = results?.next else { return }
            PokedexApiManager.shared.fechNextBatch(url: next, completion: { [weak self] results in
                self?.results = results
                self?.fetchPokemons(results: results.results)
                self?.view.collectionView.reloadData()
            })
        }
    }
    
}

extension PokemonListViewModel: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.searchBar.resignFirstResponder()
        self.view.placeholderLabel.textColor = .gray
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = self.view.searchBar.text else { return false }
        var notSuccess = false
        if text.count != 0 {
            PokedexApiManager.shared.searchPokemon(query: text) { [weak self] pokemon in
                self?.pokemons.removeAll()
                self?.pokemons.append(pokemon)
                self?.view.collectionView.reloadData()
                self?.view.searchBar.text = ""
                self?.view.noPokemonFoundLabel.textColor = .clear
                notSuccess = true
            }
            
            if !notSuccess {
                self.view.noPokemonFoundLabel.textColor = .black
                self.pokemons.removeAll()
                self.view.collectionView.reloadData()
                self.view.searchBar.text = ""
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.view.searchBar.becomeFirstResponder()
        self.view.placeholderLabel.textColor = .darkWhite
    }
    
}

