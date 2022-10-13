//
//  LoadingScreenCoordinator.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class LoadingScreenCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    
    var nav: UINavigationController
    
    init(navigationController nv: UINavigationController){
        self.nav = nv
    }
    
    func start() {
        let vc = LoadingScreenViewController()
        vc.coordinator = self
        nav.pushViewController(vc, animated: false)
    }
    
    func finish() {
        
    }
    
    
}
