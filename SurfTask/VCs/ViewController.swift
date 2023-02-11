//
//  ViewController.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class ViewController: VCExt, UICollectionViewDataSource {
    

    
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
        
        // MARK: - CollectionView (one-line)
        configureLayout()
        formView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfLanguages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguageCell.reuseID, for: [indexPath.row]) as! LanguageCell
        let lang = listOfLanguages[indexPath.row]
        cell.set(lang: lang)
        
        return cell
    }
    
    
    
}

