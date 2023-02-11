//
//  ModelData.swift
//  SurfTask
//
//  Created by Kovs on 11.02.2023.
//

import Foundation

struct Language {
    var langName: String
    var state: Bool
    
    init(langName: String, state: Bool) {
        self.langName = langName
        self.state = state
    }
}
