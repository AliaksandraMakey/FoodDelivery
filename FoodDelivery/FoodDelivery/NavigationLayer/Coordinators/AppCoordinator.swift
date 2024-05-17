//
//  AppCoordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 18.05.2024.
//

import UIKit

//MARK: - AppCoordinator
class AppCoordinator: Coordinator {
    
    override func start() {
        showOnboardingFlow()
    }
    override func finish() {
        print("AppCoordinatorFinishd")
    }
}
//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegat: self)
        // transfer to addChildCoordinator onboarding
        addChildCoordinator(onboardingCoordinator)
        
        onboardingCoordinator.start()
    }
    func showMainFlow() {
        
    }
}
//MARK: - CoordinatorFinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorFinish(childCoordinators: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinators)
        switch childCoordinators.type {
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
            
        }
    }
}
