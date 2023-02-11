//
//  Extensions.swift
//  SurfTask
//
//  Created by Kovs on 10.02.2023.
//

import UIKit

enum Languages {
    static let iOS = Language(langName: "iOS", state: false)
    static let android = Language(langName: "Android", state: false)
    static let design = Language(langName: "Design", state: false)
    static let flutter = Language(langName: "Flutter", state: false)
    static let qa = Language(langName: "QA", state: false)
    static let pm = Language(langName: "PM", state: false)
    static let kotlin = Language(langName: "Kotlin", state: false)
    static let cXX = Language(langName: "C/C++", state: false)
    static let react = Language(langName: "React Native", state: false)
    static let web = Language(langName: "JS", state: false)
}

enum SurfText {
    static let title = "Стажировка в Surf"
    static let body = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
    static let body2 = "Получай стипендию, выстраивай удобный график, работай на современном железе."
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
