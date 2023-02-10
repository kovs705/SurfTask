//
//  SurfTitle.swift
//  SurfTask
//
//  Created by Kovs on 10.02.2023.
//

import UIKit

class SurfLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    convenience init(textColor: UIColor, textSize: CGFloat, text: String, isBold: Bool) {
        self.init(frame: .zero)
        self.textColor = textColor
        self.font = .systemFont(ofSize: textSize, weight: isBold ? .bold : .regular)
        self.text = text
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        // other stuff
        numberOfLines = 0
    }

}
