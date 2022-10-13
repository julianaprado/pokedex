//
//  LoadingScreenViewController.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class LoadingScreenViewController: UIViewController {
    
    weak var coordinator: LoadingScreenCoordinator?
    
    override func viewDidLoad() {
        self.view = LoadingView()
    }
    
}
