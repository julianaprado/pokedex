//
//  PokemonDetailsViewController.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonDetailsViewController: UIViewController {
    
    fileprivate var viewModel: PokemonDetailsModelView?
    weak var coordinator: PokemonDetailsCoordnator?
    
    init(pokemon: IndividualPokemon){
        super.init(nibName: nil, bundle: nil)
        viewModel = PokemonDetailsModelView(viewController: self,  pokemon: pokemon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        guard let model = viewModel else {
            return
        }
        self.view = model.getView()
        let v = self.view as? PokemonDetailsView
        v?.pokemonAboutView.modalDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
}

extension PokemonDetailsViewController: ModalDelegate {
    
    func showModal(ability: AbilityInfo) {
        let vc = PokemonAbilityViewController(ability: ability)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .formSheet
        let smallId = UISheetPresentationController.Detent.Identifier("small")
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { context in
            return 130
        }
        nav.sheetPresentationController?.detents = [smallDetent]
        
        self.present(nav, animated: true)
    }
}
