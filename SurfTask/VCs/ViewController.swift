//
//  ViewController.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class ViewController: VCExt, UICollectionViewDataSource, UITableViewDataSource {
    
    
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
        configureLayout2()
        formView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionView()
        
        configureBody2()
        
        // MARK: - CollectionView (two-lines)
        configureLayout()
        formView.addSubview(collectionView2)
        collectionView2.delegate = self
        collectionView2.dataSource = self
        configureCollectionView2()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfLanguages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguageCell.reuseID, for: [indexPath.row]) as! LanguageCell
            let lang = listOfLanguages[indexPath.row]
            cell.set(lang: lang)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguageCell.reuseID, for: [indexPath.row]) as! LanguageCell
            let lang = listOfLanguages[indexPath.row]
            cell.set(lang: lang)
            
            return cell
        }
    }
    
    // MARK: - UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfLanguages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TVLangCell.reuseID, for: [indexPath.row]) as! TVLangCell
        let lang = listOfLanguages[indexPath.row]
        
        cell.set(lang: lang)
        
        return cell
    }
    
    
    
}

