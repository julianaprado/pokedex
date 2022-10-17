//
//  LoadingScreenViewController.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class LoadingScreenViewController: UIViewController {
    
    let modelView = LoadingScreenModelView()
    weak var coordinator: LoadingScreenCoordinator?
    var results: [Pokemon] = []
    var pokemons: [IndividualPokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.modelView.getView()
        navigationItem.hidesBackButton = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let view = self.view as? LoadingView {
            view.gifView.stopAnimating()
        }
    }
    
}
