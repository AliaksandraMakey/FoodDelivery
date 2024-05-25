//
//  ProfileCoordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 25.05.2024.
//

import UIKit

//MARK: - ProfileCoordinator
class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .green
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("ProfileCoordinator Finished")
    }
}
////MARK: - Navigation methods
//private extension ProfileCoordinator {
//    func showOnboardingFlow() {
//
//    }
//    func showMainFlow() {
//
//    }
//}
