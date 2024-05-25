//
//  AppCoordinator.swift
//  FoodDelivery
//
//  Created by Александра Макей on 18.05.2024.
//

import UIKit


// MARK: - AppCoordinator
/// `AppCoordinator` manages the primary flow of the application.
class AppCoordinator: Coordinator {
    
    /// Starts the coordinator's main functionality.
    override func start() {
        //        showOnboardingFlow()
        showMainFlow()
    }
    
    /// Handles the completion of the coordinator's work.
    override func finish() {
        print("AppCoordinatorFinished")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    /// Initiates the onboarding flow by creating and starting an `OnboardingCoordinator`.
    func showOnboardingFlow() {
#warning("обработать ошибки----")
        //-------- до выхода из гварда, чтобы была возможность отследить путь
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegat: self)
        // Adds the onboarding coordinator to the child coordinators list and starts it.
        addChildCoordinator(onboardingCoordinator)
        
        onboardingCoordinator.start()
    }
    
    /// Placeholder for the main application flow setup.
    func showMainFlow() {
#warning("обработать ошибки----")
        //---------- до выхода из гварда, чтобы была возможность отследить путь
        guard let navigationController = navigationController else { return }
        //TODO: - "вынести в конструктор сборку контроллеров"
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        //        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house.circle.fill"), tag: 0)
//TODO: - "сделать анимацию, чтобы таббар выезжал с увеличенной кнопкой на то расстояние, которое кнопка выроста и вынести названия таббара в енум"
        configureTabBarItem(for: homeNavigationController, withTitle: "Home", imageName: "lightbulb.fill", tag: 0)
        homeCoordinator.finishDelegat = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        configureTabBarItem(for: orderNavigationController, withTitle: "Order", imageName: "cart.circle.fill", tag: 1)
        orderCoordinator.finishDelegat = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        configureTabBarItem(for: listNavigationController, withTitle: "List", imageName: "slider.horizontal.3", tag: 2)
        listCoordinator.finishDelegat = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        configureTabBarItem(for: profileNavigationController, withTitle: "Profile", imageName: "person.fill", tag: 3)
        profileCoordinator.finishDelegat = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(orderCoordinator)
        addChildCoordinator(listCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = CustomTabBarController(tabBarControllers: tabBarControllers)
        tabBarController.viewControllers = tabBarControllers
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

// MARK: - CoordinatorFinishDelegate
/// Implementation of `CoordinatorFinishDelegate` to handle the completion of child coordinators.
extension AppCoordinator: CoordinatorFinishDelegate {
    /// Called when a child coordinator finishes its tasks. Handles cleanup and navigational responses.
    /// - Parameter childCoordinators: The coordinator that has finished.
    func coordinatorFinish(childCoordinators: any CoordinatorProtocol) {
        // Removes the finished coordinator from the child coordinators list.
        removeChildCoordinator(childCoordinators)
        
        // Handles the navigational response based on the type of the coordinator.
        switch childCoordinators.type {
        case .app:
            // If the app coordinator finishes, do nothing specific.
            return
        default:
            // For all other types, navigate back to the root view controller.
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

func configureTabBarItem(for navigationController: UINavigationController, withTitle title: String, imageName: String, tag: Int, selectedImageScale: CGFloat = 2) {
    guard let normalImage = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal),
          let scaledImage = normalImage.scaledImage(scale: selectedImageScale) else { return }
    
    navigationController.tabBarItem = UITabBarItem(title: title, image: normalImage, selectedImage: scaledImage)
    navigationController.tabBarItem.tag = tag
}



//// MARK: - AppCoordinator
///// `AppCoordinator` manages the primary flow of the application.
//class AppCoordinator: Coordinator {
//
//    /// Starts the coordinator's main functionality.
//    override func start() {
////        showOnboardingFlow()
//        showMainFlow()
//    }
//
//    /// Handles the completion of the coordinator's work.
//    override func finish() {
//        print("AppCoordinatorFinished")
//    }
//}
//
//// MARK: - Navigation methods
//private extension AppCoordinator {
//    /// Initiates the onboarding flow by creating and starting an `OnboardingCoordinator`.
//    func showOnboardingFlow() {
//#warning("обработать ошибки----")
//        //-------- до выхода из гварда, чтобы была возможность отследить путь
//        guard let navigationController = navigationController else { return }
//        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegat: self)
//        // Adds the onboarding coordinator to the child coordinators list and starts it.
//        addChildCoordinator(onboardingCoordinator)
//
//        onboardingCoordinator.start()
//    }
//
//    /// Placeholder for the main application flow setup.
//    func showMainFlow() {
//#warning("обработать ошибки----")
//        //---------- до выхода из гварда, чтобы была возможность отследить путь
//        guard let navigationController = navigationController else { return }
//#warning("вынести в конструктор сборку контроллеров")
//        let homeNavigationController = UINavigationController()
//        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
//        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house.circle.fill"), tag: 0)
//#warning("сделать кнопку таббара разноразмерную и вынести названия таббара в енум")
////        homeNavigationController.tabBarItem = UITabBarItem(title: <#T##String?#>, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
//        homeCoordinator.finishDelegat = self
//        homeCoordinator.start()
//
//        let orderNavigationController = UINavigationController()
//        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
//        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "cart.circle.fill"), tag: 1)
//        orderCoordinator.finishDelegat = self
//        orderCoordinator.start()
//
//        let listNavigationController = UINavigationController()
//        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
//        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "slider.horizontal.3"), tag: 2)
//        listCoordinator.finishDelegat = self
//        listCoordinator.start()
//
//        let profileNavigationController = UINavigationController()
//        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
//        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.fill"), tag: 4)
//        profileCoordinator.finishDelegat = self
//        profileCoordinator.start()
//
//        addChildCoordinator(homeCoordinator)
//        addChildCoordinator(orderCoordinator)
//        addChildCoordinator(listCoordinator)
//        addChildCoordinator(profileCoordinator)
//
//        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
//        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
//
//        navigationController.pushViewController(tabBarController, animated: true)
//    }
//}
//
//// MARK: - CoordinatorFinishDelegate
///// Implementation of `CoordinatorFinishDelegate` to handle the completion of child coordinators.
//extension AppCoordinator: CoordinatorFinishDelegate {
//    /// Called when a child coordinator finishes its tasks. Handles cleanup and navigational responses.
//    /// - Parameter childCoordinators: The coordinator that has finished.
//    func coordinatorFinish(childCoordinators: any CoordinatorProtocol) {
//        // Removes the finished coordinator from the child coordinators list.
//        removeChildCoordinator(childCoordinators)
//
//        // Handles the navigational response based on the type of the coordinator.
//        switch childCoordinators.type {
//        case .app:
//            // If the app coordinator finishes, do nothing specific.
//            return
//        default:
//            // For all other types, navigate back to the root view controller.
//            navigationController?.popToRootViewController(animated: false)
//        }
//    }
//}
