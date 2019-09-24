//
//  ViewController.swift
//  SecondWallet
//
//  Created by Chris Xu on 2019/9/7.
//  Copyright © 2019 chrisxu. All rights reserved.
//

import UIKit

class CardListViewController: UIViewController {
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 242, green: 242, blue: 247) //     systemGray6
        addCollectionView()
    }
    
    // Method: - Private method
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let layoutMarginsGuide = view.layoutMarginsGuide
        collectionView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configure(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
        
        let item = CardItem(title: "Albert Heijn", code: "2620683946907")
        
        if let cardCell = cell as? CardCollectionViewCell {
            cardCell.title = item.title
            cardCell.codeImage = item.codeImage()
        }
    }
}

extension CardListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.reuseIdentifier, for: indexPath)
        configure(cell, at: indexPath)
        
        return cell
    }
}

extension CardListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 240)
    }
}

extension CardListViewController: UICollectionViewDelegate { }
