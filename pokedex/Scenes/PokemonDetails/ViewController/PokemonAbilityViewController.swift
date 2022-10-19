//
//  PokemonAbilityViewController.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonAbilityViewController: UIViewController {

    weak var modalDelegate: ViewModalDelegate?
    var ability: AbilityInfo?
    
    init(ability: AbilityInfo){
        self.ability = ability
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        self.view = PokemonAbilityView()
        let v = self.view as? PokemonAbilityView
        
        
        PokedexApiManager.shared.fechDescription(url: ability?.url ?? "", completion: { [weak self] AbilityEntry in
            for language in AbilityEntry.effectEntries{
                if language.language.name == "en"{
                    v?.setupDescription(description: language.effect)
                    break
                }
            }
        })
    }
    
    
}
