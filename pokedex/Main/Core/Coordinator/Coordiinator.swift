//
//  Coordiinator.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var children = [Coordinator]()
    
    var nav: UINavigationController
    
    init(navigationController nv: UINavigationController){
        self.nav = nv
    }
    
    func start() {
        let loadingCoord = LoadingScreenCoordinator(navigationController: nav)
        loadingCoord.start()
    }
    
    func finish() {
        
    }
    
}
