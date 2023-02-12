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
        
        
        // MARK: - Texts
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
        
        // MARK: - Bottom
        configureBottomView()
        configureCallLabel()
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView {
            var object = listOfLanguages[indexPath.row]
            
            self.collectionView.performBatchUpdates {
                object.state.toggle()
            }
            
            if object.state == true {
                self.updateData(with: object, from: indexPath, collectionView: self.collectionView)
                object = listOfLanguages[0]
                
                self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
                
                self.collectionView.reloadSections(IndexSet(IndexPath(row: 0, section: 0)))
            } else if object.state == false {
                guard let cell = collectionView2.cellForItem(at: indexPath) as? LanguageCell else { return }
                listOfLanguages.remove(at: indexPath.row)
                listOfLanguages.insert(object, at: indexPath.row)
                
                cell.set(lang: object)
            
                self.collectionView.reloadItems(at: [indexPath])
                
            }
            self.collectionView.reloadData()
            self.collectionView.layoutIfNeeded()
            
            for result in listOfLanguages {
                if result.state {
                    results.append(result.langName)
                }
            }
            
        } else if collectionView == self.collectionView2{
            var object = botttomList[indexPath.row]
            guard let cell = collectionView2.cellForItem(at: indexPath) as? LanguageCell else { return }
            
            collectionView2.performBatchUpdates {
                object.state.toggle()
            }
            
            if object.state == true {
                cell.contentView.backgroundColor = UIColor(named: "darkDarkGray")
                cell.layer.cornerRadius = 15
                cell.set(lang: object)
                cell.langLabel.textColor = .white
            } else {
                cell.contentView.backgroundColor = .systemGray6
                cell.layer.cornerRadius = 15
                
                cell.set(lang: object)
                cell.langLabel.textColor = .label
            }
            
            botttomList.remove(at: indexPath.row)
            botttomList.insert(object, at: indexPath.row)

            self.collectionView2.layoutIfNeeded()
            self.collectionView2.reloadData()
        }
    }
    
    func updateData(with object: Language, from: IndexPath, collectionView: UICollectionView) {
        if collectionView == self.collectionView {
            
            self.collectionView.performBatchUpdates {
                listOfLanguages.remove(at: from.row)
                listOfLanguages.insert(object, at: 0)
                
            }
            self.collectionView.reloadItems(at: [from])
            self.collectionView.reloadData()
        }
    }
    
    
}

