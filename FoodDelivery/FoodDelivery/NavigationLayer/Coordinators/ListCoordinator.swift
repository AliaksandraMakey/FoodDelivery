//
//  ListCoordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 25.05.2024.
//

import UIKit

//MARK: - ListCoordinator
class ListCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("ListCoordinatorFinished")
    }
}
////MARK: - Navigation methods
//private extension ListCoordinator {
//    func showOnboardingFlow() {
//
//    }
//    func showMainFlow() {
//
//    }
//}
