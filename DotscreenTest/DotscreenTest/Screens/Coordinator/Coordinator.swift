//
//  Coordinator.swift
//  DotscreenTest
//
//  Created by CHEN on 23/07/2022.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

extension Coordinator {
    
    func add(coordinator: Coordinator) -> Void {
        self.childCoordinators.append(coordinator)
    }
    
    func remove(coordinator: Coordinator) -> Void {
        childCoordinators = childCoordinators.filter({ $0 !== coordinator })
    }
}
