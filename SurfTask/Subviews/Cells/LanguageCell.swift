//
//  LanguageCell.swift
//  SurfTask
//
//  Created by Kovs on 11.02.2023.
//

import UIKit

class LanguageCell: UICollectionViewCell {
    
    static let reuseID = "language"
//    let backView = UIView(frame: .zero)
    let langLabel = SurfLabel(textColor: .label, textSize: 16, isBold: false)
    
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(lang: Language) {
        langLabel.text = lang.langName
    }
    
    private func configure() {
//        addSubview(backView)
        contentView.addSubview(langLabel)
        langLabel.translatesAutoresizingMaskIntoConstraints = false
        langLabel.textColor = .label
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            
            contentView.heightAnchor.constraint(equalToConstant: 16.0 + 25.0),
            langLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            langLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
//            langLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
//            langLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
//            langLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
//            langLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
}