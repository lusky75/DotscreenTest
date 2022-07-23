//
//  LaunchVC.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import UIKit

class LaunchVC: UIViewController {
    
    var startGameButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Start playing", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        button.backgroundColor = UIColor(named: "C33131")
        return button
    }()
    
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(startGameButton)
        
        NSLayoutConstraint.activate([
            startGameButton.heightAnchor.constraint(equalToConstant: 40),
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        startGameButton.addTarget(self, action: #selector(startPlayingGameAction), for: .touchUpInside)
    }
    
    @objc func startPlayingGameAction() {
        coordinator?.startPlayingGame()
    }

}
