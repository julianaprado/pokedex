//
//  PokemonDetailsModelView.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonDetailsModelView: NSObject {

    
    
    weak var viewController: PokemonDetailsViewController?
    private let view = PokemonDetailsView()
    private let viewDescription = PokemonAbilityView()
    let pokemon: IndividualPokemon?
    var sprites: [String] = []
    var species: PokemonSpecies?
    
    init(viewController: PokemonDetailsViewController, pokemon: IndividualPokemon){
        self.viewController = viewController
        self.pokemon = pokemon
        super.init()
        
        PokedexApiManager.shared.searchSpecies(url: pokemon.species.url) { [weak self] specie in
            self?.view.setPokemonDetails(pokemon: pokemon, species: specie)
        }
        
        let mirror = Swift.Mirror(reflecting: pokemon.sprites)
        for sprite in mirror.children {
            if (sprite.value as? String) != nil {
                sprites.append(sprite.value as! String)
            }
            
        }
        sprites = sprites.reversed()
        
        self.view.collectionView.delegate = self
        self.view.collectionView.dataSource = self
        self.view.collectionView.dragDelegate = self
    }
    
    func getView() -> PokemonDetailsView{
        return self.view
    }
    
    func snapToCenter() {
        let centerPoint = view.collectionView.center
        guard let centerIndexPath = view.collectionView.indexPathForItem(at: centerPoint) else { return }
        view.collectionView.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
      }
    
}

extension PokemonDetailsModelView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDragDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sprites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.view.collectionView.dequeueReusableCell(withReuseIdentifier: PokemonDetailsCell.identifier, for: indexPath) as? PokemonDetailsCell else { return UICollectionViewCell() }
        
        
        
        PokedexApiManager.shared.fetchPokemonImage(url: sprites[indexPath.row]) { data in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.imageView.image = image
                }
            }
        }
        
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        snapToCenter()
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return []
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
          
       }
       
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
           if !decelerate {
               snapToCenter()
           }
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.collectionView.bounds.width, height: 150)
       }
    
}

extension PokemonDetailsModelView: ViewModalDelegate {
    
    func getDescriptionView() -> PokemonAbilityView {
        return self.viewDescription
    }
    
    
   
    
}
