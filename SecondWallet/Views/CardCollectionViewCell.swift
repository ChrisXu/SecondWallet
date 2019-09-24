//
//  CardCollectionViewCell.swift
//  SecondWallet
//
//  Created by Chris Xu on 2019/9/8.
//  Copyright © 2019 chrisxu. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell, Reusable {
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var codeImage: UIImage? = nil {
        didSet {
            barCodeImageView.image = codeImage
        }
    }
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = .black
        return label
    }()
    
    private(set) lazy var barCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private method
    
    private func setUp() {
        backgroundColor = .white
        layer.cornerRadius = 20
        addTitleLabel()
        addBarCodeImageView()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
    
    private func addBarCodeImageView() {
        contentView.addSubview(barCodeImageView)
        barCodeImageView.translatesAutoresizingMaskIntoConstraints = false
        barCodeImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        barCodeImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        barCodeImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        barCodeImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
    }
}
