//
//  AcceptButton.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class AcceptButton: UIButton {
    
    let label = SurfLabel(textColor: .white, textSize: 18, isBold: false)
    let back = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    convenience init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        label.translatesAutoresizingMaskIntoConstraints = false
        back.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Отправить заявку"
        
        layer.cornerRadius = 25
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            widthAnchor.constraint(equalToConstant: 200),
            heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}
