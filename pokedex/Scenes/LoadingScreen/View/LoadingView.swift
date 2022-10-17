//
//  LoadingView.swift
//  pokedex
//
//  Created by Juliana Prado on 12/10/22.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    lazy var gifView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var loadingLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.textColor = .black
        label.textAlignment = .center
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
        gifView.removeFromSuperview()
    }
    
}

extension LoadingView: UIViewLayout {
    
    func setupHierarchy() {
        self.addSubview(gifView)
        self.addSubview(loadingLabel)
    }
    
    func setupConstraints() {
        
        ///pikachu view constraints
        gifView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -40).isActive = true
        gifView.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor, constant: -14).isActive = true
        gifView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        gifView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        ///label costraints
        loadingLabel.topAnchor.constraint(equalTo: gifView.bottomAnchor).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive = true
        loadingLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        loadingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupViews() {
        gifView.loadGif(name: "pikachu")
        loadingLabel.text = "loading"
    }
    
    
}
