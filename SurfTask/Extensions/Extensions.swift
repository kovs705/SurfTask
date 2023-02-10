//
//  Extensions.swift
//  SurfTask
//
//  Created by Kovs on 10.02.2023.
//

import UIKit

enum SurfText {
    static let title = "Стажировка в Surf"
    static let body = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
    static let iWant = "Хочешь к нам?"
}

extension UILabel {
    func giveLineSpacing(lineSpacing: CGFloat, lineHeightMultiple: CGFloat = 0.0) {
        guard let text = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString: NSMutableAttributedString // future attributed string
        
        if let labelAttributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: text)
        }
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}
