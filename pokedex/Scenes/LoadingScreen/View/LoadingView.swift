//
//  LoadingView.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    private lazy var gifView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoadingView: UIViewLayout {
    
    func setupHierarchy() {
        self.addSubview(gifView)
    }
    
    func setupConstraints() {
        gifView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
        gifView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        gifView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func setupViews() {
        gifView.loadGif(name: "pikachu")
    }
    
    
}
