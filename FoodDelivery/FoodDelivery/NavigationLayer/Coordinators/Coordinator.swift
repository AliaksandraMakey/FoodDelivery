//
//  Coordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 18.05.2024.
//

import UIKit

//MARK: - Coordinator
class Coordinator: CoordinatorProtocol {
    var type: CoordinatorType
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var navigationController: UINavigationController?
    
    var finishDelegat: CoordinatorFinishDelegate?

    init(type: CoordinatorType,
         childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](),
         navigationController: UINavigationController,
         finishDelegat: CoordinatorFinishDelegate? = nil) {
        self.type = type
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
        self.finishDelegat = finishDelegat
    }
    deinit {
        print("Coordinator deinited \(type)")
        childCoordinators.forEach{ $0.finishDelegat = nil }
            childCoordinators.removeAll()
    }
    func start() {
        print("Coordinator start")
    }
    
    func finish() {
        print("Coordinator finish")
    }
    
    
}
