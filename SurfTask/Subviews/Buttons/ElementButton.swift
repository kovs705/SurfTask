//
//  ElementButton.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class ElementButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    convenience init(label: String) {
        self.init(frame: .zero)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 20
        // TODO: setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        translatesAutoresizingMaskIntoConstraints = false
    }

}
