//
//  ViewControllerExt.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class VCExt: UIViewController {
    
    // MARK: - Properties
    
    let padding: CGFloat = 22
    
    let surfTitle = SurfLabel(textColor: .label, textSize: 30, text: SurfText.title, isBold: true)
    let surfBody = SurfLabel(textColor: .systemGray, textSize: 14, text: SurfText.body, isBold: false)
    let surfCall = SurfLabel(textColor: .systemGray, textSize: 14, text: SurfText.iWant, isBold: false)
    
    let imageContainer: UIView = {
        let imageContainer = UIView()
        imageContainer.backgroundColor = .clear
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        return imageContainer
    }()
    
    let backImage: UIImageView = {
        let back = UIImageView()
        back.backgroundColor = .black
        back.image = UIImage(named: "iceland")
        back.contentMode = .scaleAspectFill
        back.clipsToBounds = true
        
        back.translatesAutoresizingMaskIntoConstraints = false
        
        return back
    }()
    
    let formView: UIView = {
        let formView = UIView()
        formView.backgroundColor = .systemBackground
        formView.layer.cornerRadius = 40
        
        formView.translatesAutoresizingMaskIntoConstraints = false
        
        return formView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .systemBackground
        scrollView.alwaysBounceHorizontal = false
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    
    // MARK: - Functions
    
    
    func configureTitle() {
        surfTitle.translatesAutoresizingMaskIntoConstraints = false
        formView.addSubview(surfTitle)
        
        NSLayoutConstraint.activate([
            surfTitle.topAnchor.constraint(equalTo: formView.topAnchor, constant: 25),
            surfTitle.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: padding),
            surfTitle.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -padding),
        ])
    }
    
    func configureBody() {
        surfBody.translatesAutoresizingMaskIntoConstraints = false
        surfBody.giveLineSpacing(lineSpacing: 5)
        formView.addSubview(surfBody)
        
        NSLayoutConstraint.activate([
            surfBody.topAnchor.constraint(equalTo: surfTitle.bottomAnchor, constant: 20),
            surfBody.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: padding),
            surfBody.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureFormView() {
        let g = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            formView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            formView.heightAnchor.constraint(equalToConstant: view.bounds.height - 80),
            
            formView.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -40),
            formView.leadingAnchor.constraint(equalTo: g.leadingAnchor),
            formView.trailingAnchor.constraint(equalTo: g.trailingAnchor),
            formView.bottomAnchor.constraint(equalTo: g.bottomAnchor)
        ])
    }
    
    
    func configureContainer() {
        let g = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            imageContainer.widthAnchor.constraint(equalToConstant: view.bounds.width),
            imageContainer.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.65),
            
            imageContainer.topAnchor.constraint(equalTo: g.topAnchor, constant: -50),
            imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    func configureImage() {
        let topConstant = backImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -50)
        topConstant.priority = .defaultHigh

        let heightConstraint = backImage.heightAnchor.constraint(greaterThanOrEqualTo: imageContainer.heightAnchor)
        heightConstraint.priority = .required
        
        NSLayoutConstraint.activate([
            backImage.widthAnchor.constraint(equalToConstant: view.bounds.width),
            heightConstraint,
            
            topConstant,
            backImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            backImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor)

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
