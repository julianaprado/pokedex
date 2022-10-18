//
//  ModalDelegate.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

protocol ModalDelegate: AnyObject {
    func showModal(ability: AbilityInfo)
}

protocol ViewModalDelegate: AnyObject{
    func getDescriptionView() -> PokemonAbilityView
}
