//
//  GameBoardCollectionViewCell.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import Foundation
import UIKit

class GameBoardCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "GameBoardCollectionViewCell"
    
    var mainView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    var contentImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    override func layoutSubviews() {
        
        addSubview(mainView)
        mainView.addSubview(contentImageView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 1),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            
            
            contentImageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
        ])
    }
}
