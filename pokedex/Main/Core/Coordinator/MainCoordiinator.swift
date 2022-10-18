//
//  Coordiinator.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var children = [Coordinator]()
    var nav: UINavigationController
    
    init(navigationController nv: UINavigationController){
        self.nav = nv
    }
    
    func startLoadingScreen() {
        nav.delegate = self
        let loadingCoord = LoadingScreenCoordinator(navigationController: nav)
        loadingCoord.parentCoordinator = self
        children.append(loadingCoord)
        loadingCoord.start()
    }
    
    func startPokemonList() {
        nav.delegate = self
        let pokemonList = PokemonListCoordinator(navigationController: nav)
        pokemonList.parentCoordinator = self
        children.append(pokemonList)
        pokemonList.start()
    }
    
    func startPokemonDetailsScreen(pokemon: IndividualPokemon){
        nav.delegate = self
        let pokemonList = PokemonDetailsCoordnator(navigationController: nav)
        pokemonList.parentCoordinator = self
        children.append(pokemonList)
        pokemonList.start(pokemon: pokemon)
    }
    
    func start() {
        
    }
    
    
    func finish() {
        
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
                break
            }
        }
    }
//    
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        guard let fromViewController = nav.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//        
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//        
//        if let loadingViewController = fromViewController as? LoadingScreenViewController {
//            childDidFinish(loadingViewController.coordinator)
//        }
//        
//    }
    
}
