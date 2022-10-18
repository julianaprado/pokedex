//
//  PokemonTypeSwitch.swift
//  pokedex
//
//  Created by Juliana Prado on 17/10/22.
//

import Foundation
import UIKit

class PokemonPropertiesFunctions {
    
    static func capitalizingFirstLetter(name: String) -> String {
        return name.prefix(1).uppercased() + name.lowercased().dropFirst()
    }
    
    static func applyMaskToPokemonId(with id: Int) -> String {
        let idAsString = String(id)
        let mask = "#000"
        return mask.dropLast(idAsString.count) + idAsString
    }
    
    /// Recieves type and returns its corresponding properties
    /// - Parameter type: A pokemon type
    /// - Returns: tuple containing:
    /// UIColor - Pokemon type standard color
    /// UIImage - Pokemon type standard icon
    /// UIColor - Pokemon type dark color
    static func setTypeComponents(withType type: String) -> (UIColor, UIImage, UIColor){
        switch type {
        case "bug" :
            return (UIColor.bug, UIImage.bug, UIColor.bugDark)
        case "dark" :
            return (UIColor.dark, UIImage.dark, UIColor.darkDark)
        case "dragon" :
            return (UIColor.dragon, UIImage.dragon, UIColor.dragonDark)
        case "electric" :
            return (UIColor.electric, UIImage.electric, UIColor.electricDark)
        case "fairy" :
            return (UIColor.fairy, UIImage.fairy, UIColor.fairyDark)
        case "fighting" :
            return (UIColor.fighting, UIImage.fighting, UIColor.fightingDark)
        case "fire" :
            return (UIColor.fire, UIImage.fire, UIColor.fireDark)
        case "flying" :
            return (UIColor.flying, UIImage.flying, UIColor.flyingDark)
        case "ghost" :
            return (UIColor.ghost, UIImage.ghost, UIColor.ghostDark)
        case "grass" :
            return (UIColor.grass, UIImage.grass, UIColor.grassDark)
        case "ground" :
            return (UIColor.ground, UIImage.ground, UIColor.groundDark)
        case "ice" :
            return (UIColor.ice, UIImage.ice, UIColor.iceDark)
        case "normal" :
            return (UIColor.normal, UIImage.normal, UIColor.normalDark)
        case "poison" :
            return (UIColor.poison, UIImage.poison, UIColor.poisonDark)
        case "psychic" :
            return (UIColor.psychic, UIImage.psychic, UIColor.psychicDark)
        case "rock" :
            return (UIColor.rock, UIImage.rock, UIColor.rockDark)
        case "steel" :
            return (UIColor.steel, UIImage.steel, UIColor.steelDark)
        case "water" :
            return (UIColor.water, UIImage.water, UIColor.waterDark)
        default:
            print("Unknown Type")
            return (.clear, UIImage.checkmark, .clear)
        }
    }
}
