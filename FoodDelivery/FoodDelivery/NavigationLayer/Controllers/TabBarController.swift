//
//  TabBarController.swift
//  FoodDelivery
//
//  Created by Александра Макей on 25.05.2024.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
#warning("вынести сборку таббара в отдельный метод")
        tabBar.backgroundColor = AppColors.background
        tabBar.tintColor = AppColors.accentOrange
        
    }
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControllers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
