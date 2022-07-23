//
//  MainCoordinator.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    /*
     the method start will define the root ViewController of Coordinator as DashboardVC
     */
    func start() {
        print("start")
        let launchVC = LaunchVC()
        launchVC.coordinator = self
        self.navigationController.pushViewController(launchVC, animated: false)
    }
    
    func startPlayingGame() {
        let gameVC = GameVC()
        gameVC.coordinator = self
        self.navigationController.pushViewController(gameVC, animated: true)
    }
    
    func previousPage() {
        self.navigationController.viewDidLoad()
        self.navigationController.popViewController(animated: true)
    }
}
