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
        
        contentView.backgroundColor = lang.state ? UIColor(named: "darkDarkGray") : .systemGray6
        langLabel.textColor = lang.state ? .white : .label
        contentView.layer.cornerRadius = 15
    }
    
    private func configure() {
//        addSubview(backView)
        contentView.addSubview(langLabel)
        langLabel.translatesAutoresizingMaskIntoConstraints = false
        langLabel.textColor = .label
        langLabel.lineBreakMode = .byTruncatingTail
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 15
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        heightConstraint.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            heightConstraint,
            langLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            langLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
