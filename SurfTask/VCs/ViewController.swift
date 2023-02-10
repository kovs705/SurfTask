//
//  ViewController.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class ViewController: VCExt {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Main containers
        self.view.addSubview(scrollView)
        configureSV()
        
        scrollView.addSubview(imageContainer)
        configureContainer()
        
        scrollView.addSubview(backImage)
        configureImage()
        
        scrollView.addSubview(formView)
        configureFormView()
        
        
        // MARK: - Subviews
        configureTitle()
        configureBody()
        
    }
    
    
    
}

