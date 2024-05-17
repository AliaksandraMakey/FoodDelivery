//
//  Coordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 18.05.2024.
//

import UIKit

enum CoordinatorType {
    case app, onboarding, home, order, list, profile
}
protocol CoordinatorProtocol: AnyObject {
    var type: CoordinatorType { get }
    // child
    var childCoordinators: [CoordinatorProtocol] { get set }
    //navigation
    var navigationController: UINavigationController? { get set }
    // child coordinator finishes
    var finishDelegat: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}
extension CoordinatorProtocol {
    /// Adds a child coordinator to the array of child coordinators.
    ///
    /// - Parameter childCoordinator: The child coordinator to be added.
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    /// Removes a child coordinator from the array of child coordinators.
    ///
    /// - Parameter childCoordinator: The child coordinator to be removed.
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
}
protocol CoordinatorFinishDelegate {
    /// Called when a child coordinator finishes its work.
    ///
    /// - Parameter childCoordinator: The child coordinator that finished its work.
    func coordinatorFinish(childCoordinators: CoordinatorProtocol)
}
