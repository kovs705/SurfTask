//
//  ViewController.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let backImage: UIImageView = {
        let back = UIImageView()
        back.backgroundColor = .black
        back.image = UIImage(named: "iceland")
        
        back.translatesAutoresizingMaskIntoConstraints = false
        
        return back
    }()
    
    let formView: UIView = {
        let formView = UIView()
        formView.backgroundColor = .green
        formView.layer.cornerRadius = 20
        
        formView.translatesAutoresizingMaskIntoConstraints = false
        
        return formView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .systemBackground
        scrollView.alwaysBounceHorizontal = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        configureSV()
        
        scrollView.addSubview(backImage)
        configureImage()

    }
    
    func configureImage() {
        let g = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            backImage.widthAnchor.constraint(equalToConstant: view.bounds.width),
            backImage.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.65),
            
            backImage.topAnchor.constraint(equalTo: g.topAnchor, constant: 16),
            backImage.leadingAnchor.constraint(equalTo: g.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: g.trailingAnchor),
            
            backImage.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: -(2000.0 - (100.0 + 16.0)))
        ])
    }
    
    
    
    func configureSV() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
}

