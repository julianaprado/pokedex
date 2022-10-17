//
//  CoreProtocol.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

//MARK: - Core Protocol
public protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var nav: UINavigationController { get set }
    func start()
    func finish()

}
