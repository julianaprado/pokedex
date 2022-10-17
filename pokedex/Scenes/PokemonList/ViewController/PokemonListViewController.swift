//
//  PokemonListViewController.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class PokemonListViewController: UIViewController {

    fileprivate var viewModel: PokemonListViewModel?
    weak var viewModelDelegate: PokemonListViewModelDelegate?
    weak var coordinator: PokemonListCoordinator?
    
    init(){
        super.init(nibName: nil, bundle: nil)
        viewModel = PokemonListViewModel(viewController: self)
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
        self.viewModel?.fectchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
}
