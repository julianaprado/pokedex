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
        
        PokedexApiManager.shared.fechDescription(url: ability?.url ?? "", completion: { AbilityEntry in
            let language1 = AbilityEntry.effectEntries[0].language.name
            let language2 = AbilityEntry.effectEntries[1].language.name
            if language1 == "en"{
                v?.setupDescription(description: AbilityEntry.effectEntries[0].effect)
            } else {
                v?.setupDescription(description: AbilityEntry.effectEntries[1].effect)
            }
                
        })
    }
    
    
}
