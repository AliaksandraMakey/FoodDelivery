//
//  OrderCoordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 25.05.2024.
//

import UIKit

//MARK: - OrderCoordinator
class OrderCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("OrderCoordinatorFinished")
    }
}
////MARK: - Navigation methods
//private extension OrderCoordinator {
//    func showOnboardingFlow() {
//
//    }
//    func showMainFlow() {
//
//    }
//}
