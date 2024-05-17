//
//  OnboardingCoordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 18.05.2024.
//

import UIKit

//MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinatorFinishd")
    }
}
////MARK: - Navigation methods
//private extension AppCoordinator {
//    func showOnboardingFlow() {
//
//    }
//    func showMainFlow() {
//
//    }
//}
