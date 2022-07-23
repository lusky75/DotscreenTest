//
//  GameView.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import Foundation
import UIKit

class GameView: UIView {
    
    var gameMinutesLeftLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.red
        label.text = "00"
        label.font = UIFont.setBoldAppFont(size: 24)
        return label
    }()
    
    var doubleDotLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.red
        label.text = ":"
        label.font = UIFont.setBoldAppFont(size: 24)
        return label
    }()
    
    var gameSecondsLeftLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.red
        label.text = "00"
        label.font = UIFont.setBoldAppFont(size: 24)
        return label
    }()
    
    var playerOneNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "Player 1 :"
        label.font = UIFont.setAppFont(size: 18)
        return label
    }()
    
    var playerOneScoreLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "0"
        label.font = UIFont.setBoldAppFont(size: 24)
        return label
    }()
    
    var playerTwoNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "Player 2 :"
        label.font = UIFont.setAppFont(size: 18)
        return label
    }()
    
    var playerTwoScoreLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "0"
        label.font = UIFont.setBoldAppFont(size: 24)
        return label
    }()
    
    var gameBoardCollectionView: UICollectionView =  {
        let collectionFlow: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionFlow.minimumInteritemSpacing = 8
        collectionFlow.scrollDirection = .vertical
        
        collectionFlow.minimumLineSpacing = 0
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionFlow)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
        setupViewConstraints()
    }
    
    func setupView() {
        addSubview(gameMinutesLeftLabel)
        addSubview(doubleDotLabel)
        addSubview(gameSecondsLeftLabel)
        
        addSubview(playerOneNameLabel)
        addSubview(playerOneScoreLabel)
        addSubview(playerTwoNameLabel)
        addSubview(playerTwoScoreLabel)
        
        addSubview(gameBoardCollectionView)
    }
    
    func setupViewConstraints() {
        
        NSLayoutConstraint.activate([
            gameMinutesLeftLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            gameMinutesLeftLabel.trailingAnchor.constraint(equalTo: doubleDotLabel.leadingAnchor, constant: -2.5),
            
            doubleDotLabel.bottomAnchor.constraint(equalTo: gameMinutesLeftLabel.bottomAnchor),
            
            gameSecondsLeftLabel.leadingAnchor.constraint(equalTo: doubleDotLabel.trailingAnchor, constant: 2.5),
            gameSecondsLeftLabel.topAnchor.constraint(equalTo: gameMinutesLeftLabel.topAnchor),
            gameSecondsLeftLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            
            playerOneScoreLabel.topAnchor.constraint(equalTo: gameSecondsLeftLabel.bottomAnchor, constant: 20),
            playerOneScoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            playerOneNameLabel.bottomAnchor.constraint(equalTo: playerOneScoreLabel.bottomAnchor),
            playerOneNameLabel.trailingAnchor.constraint(equalTo: playerOneScoreLabel.leadingAnchor, constant: -30),
            
            
            playerTwoScoreLabel.topAnchor.constraint(equalTo: playerOneScoreLabel.bottomAnchor, constant: 30),
            playerTwoScoreLabel.trailingAnchor.constraint(equalTo: playerOneScoreLabel.trailingAnchor),
            
            playerTwoNameLabel.bottomAnchor.constraint(equalTo: playerTwoScoreLabel.bottomAnchor),
            playerTwoNameLabel.trailingAnchor.constraint(equalTo: playerTwoScoreLabel.leadingAnchor, constant: -30),
            
        ])
        
        //gameBoardCollectionView constraints
        NSLayoutConstraint.activate([
            gameBoardCollectionView.topAnchor.constraint(equalTo: gameMinutesLeftLabel.topAnchor),
            gameBoardCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            gameBoardCollectionView.trailingAnchor.constraint(equalTo: playerOneNameLabel.leadingAnchor, constant: -20),
            gameBoardCollectionView.heightAnchor.constraint(equalTo: gameBoardCollectionView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
