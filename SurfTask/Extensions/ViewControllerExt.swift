//
//  ViewControllerExt.swift
//  SurfTask
//
//  Created by Kovs on 09.02.2023.
//

import UIKit

class VCExt: UIViewController {
    
    // MARK: - Properties
    var listOfLanguages: [Language] = [Languages.iOS, Languages.android, Languages.design, Languages.flutter, Languages.qa, Languages.pm, Languages.kotlin, Languages.cXX, Languages.react, Languages.objc]
    var botttomList: [Language] = [Languages.iOS, Languages.android, Languages.design, Languages.flutter, Languages.qa, Languages.react,]
    
    let padding: CGFloat = 20
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let layout2: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    let surfTitle = SurfLabel(textColor: .label, textSize: 26, isBold: true)
    let surfBody = SurfLabel(textColor: .systemGray, textSize: 14.5, isBold: false)
    let surfBody2 = SurfLabel(textColor: .systemGray, textSize: 14.5, isBold: false)
    let surfCall = SurfLabel(textColor: .systemGray, textSize: 14.5, isBold: false)
    
    let acceptButton = AcceptButton(backgroundColor: UIColor(named: "darkDarkGray")!)
    
    lazy var imageContainer: UIView = {
        let imageContainer = UIView()
        imageContainer.backgroundColor = .clear
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        return imageContainer
    }()
    
    lazy var backImage: UIImageView = {
        let back = UIImageView()
        back.backgroundColor = .black
        back.image = UIImage(named: "iceland")
        back.contentMode = .scaleAspectFill
        back.clipsToBounds = true
        
        back.translatesAutoresizingMaskIntoConstraints = false
        
        return back
    }()
    
    lazy var formView: UIView = {
        let formView = UIView()
        formView.backgroundColor = .systemBackground
        formView.layer.cornerRadius = 40
        
        formView.translatesAutoresizingMaskIntoConstraints = false
        
        return formView
    }()
    
    lazy var bottomView: UIView = {
        let bottomView = UIView()
        bottomView.backgroundColor = .systemBackground
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        return bottomView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.backgroundColor = .systemBackground
        stackView.spacing = 10
        stackView.distribution = .fill
        
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .systemBackground
        scrollView.alwaysBounceHorizontal = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.isPagingEnabled = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.frame = CGRect(x: 0, y: 0, width: Int(formView.bounds.width), height: 55)
        collectionView.register(LanguageCell.self, forCellWithReuseIdentifier: LanguageCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    lazy var collectionView2: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        collectionView.frame = CGRect(x: 0, y: 0, width: Int(formView.bounds.width), height: 110)
        collectionView.register(LanguageCell.self, forCellWithReuseIdentifier: LanguageCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        
        return collectionView
    }()
    
// MARK: - Configure Functions
    
   // MARK: - Title and bodies
    func configureTitle() {
        surfTitle.translatesAutoresizingMaskIntoConstraints = false
        surfTitle.text = SurfText.title
        formView.addSubview(surfTitle)
        
        NSLayoutConstraint.activate([
            surfTitle.topAnchor.constraint(equalTo: formView.topAnchor, constant: 25),
            surfTitle.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: padding),
            surfTitle.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -padding),
        ])
    }

    func configureBody() {
        surfBody.translatesAutoresizingMaskIntoConstraints = false
        surfBody.text = SurfText.body
        surfBody.giveLineSpacing(lineSpacing: 5)
        formView.addSubview(surfBody)
        
        NSLayoutConstraint.activate([
            surfBody.topAnchor.constraint(equalTo: surfTitle.bottomAnchor, constant: 18),
            surfBody.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: padding),
            surfBody.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureBody2() {
        surfBody2.translatesAutoresizingMaskIntoConstraints = false
        surfBody2.text = SurfText.body2
        surfBody2.giveLineSpacing(lineSpacing: 5)
        formView.addSubview(surfBody2)
        
        NSLayoutConstraint.activate([
            surfBody2.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 18),
            surfBody2.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: padding),
            surfBody2.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -padding)
        ])
    }
    
    
    // MARK: - FormView
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
    
    
    // MARK: - BottomView with subviews
    func configureBottomView() {
        view.addSubview(bottomView)
        view.bringSubviewToFront(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bottomView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.15),
            bottomView.widthAnchor.constraint(equalToConstant: view.bounds.width)
        ])
    }
    
    func configureCallLabel() {
        surfCall.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        
        acceptButton.addTarget(self, action: #selector(showHooray), for: .touchUpInside)
        
        surfCall.text = SurfText.iWant
        surfCall.textAlignment = .center
        
        bottomView.addSubview(stackView)
        stackView.addArrangedSubview(surfCall)
        stackView.addArrangedSubview(acceptButton)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    // MARK: - UIAlertController
    @objc func showHooray(sender: UIButton) {
        print("Ура!")
        let ac = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let close = UIAlertAction(title: "Закрыть", style: .cancel)
        ac.addAction(close)
        present(ac, animated: true)
    }
    
    
    // MARK: - Container for ImageView
    func configureContainer() {
        let g = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            imageContainer.widthAnchor.constraint(equalToConstant: view.bounds.width),
            imageContainer.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.7),
            
            imageContainer.topAnchor.constraint(equalTo: g.topAnchor, constant: -50),
            imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    // MARK: - ImageView
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
    
    
    // MARK: - ScrollView
    func configureSV() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
    // MARK: - Layouts
    func configureLayout() {
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        // layout.itemSize = CGSize(width: 100, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
    }
    
    func configureLayout2() {
        layout2.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout2.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout2.minimumLineSpacing = 10
        layout2.minimumInteritemSpacing = 10
    }
    
    
    // MARK: - CollectionView
    func configureCollectionView() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: surfBody.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: formView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func configureCollectionView2() {
        
        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: surfBody2.bottomAnchor, constant: 10),
            collectionView2.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: padding),
            collectionView2.trailingAnchor.constraint(equalTo: formView.trailingAnchor),
            collectionView2.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
}

// MARK: - UICollectionView
extension VCExt: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemLang = listOfLanguages[indexPath.row]
        return CGSize(width: itemLang.langName.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]).width + 45,
                      height: itemLang.langName.size(withAttributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]).height + 25)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}


