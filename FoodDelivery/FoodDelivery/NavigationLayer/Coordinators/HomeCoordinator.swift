//
//  HomeCoordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 25.05.2024.
//

import UIKit

//MARK: - HomeCoordinator
class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .blue
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("HomeCoordinatorFinished")
    }
}
////MARK: - Navigation methods
//private extension HomeCoordinator {
//    func showOnboardingFlow() {
//
//    }
//    func showMainFlow() {
//
//    }
//}
