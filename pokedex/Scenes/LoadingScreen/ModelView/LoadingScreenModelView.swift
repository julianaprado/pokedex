//
//  LoadingScreenModelView.swift
//  pokedex
//
//  Created by Juliana Prado on 13/10/22.
//

import Foundation

class LoadingScreenModelView: NSObject {
    
    private var view = LoadingView()

    func getView() -> LoadingView {
        return view
    }
    
}

