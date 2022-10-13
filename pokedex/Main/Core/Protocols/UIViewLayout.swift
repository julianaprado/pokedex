//
//  UIViewLayout.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation

//MARK: - UIViewLayout
public protocol UIViewLayout: AnyObject {
    func setupHierarchy()
    func setupConstraints()
    func setupViews()
}

/// Extention of UIViewLayout
extension UIViewLayout {
    func configureView(){
        setupHierarchy()
        setupConstraints()
        setupViews()
    }
}
