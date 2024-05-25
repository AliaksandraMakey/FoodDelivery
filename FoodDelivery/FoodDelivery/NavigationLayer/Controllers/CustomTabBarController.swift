//
//  CustomTabBarController.swift
//  FoodDelivery
//
//  Created by Александра Макей on 26.05.2024.
//

import UIKit

class CustomTabBar: UITabBar {
    override func setItems(_ items: [UITabBarItem]?, animated: Bool) {
        super.setItems(items, animated: animated)
        // нужно получить отсюда значение, что систем айтем нажат
    }

    func adjustSize(selectedIndex: Int) {
        let newHeight = selectedIndex == 0 ? 100 : 49  // Пример изменения размера
        if let frame = self.superview?.frame {
            UIView.animate(withDuration: 0.3) {
                self.superview?.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: CGFloat(newHeight))
                self.frame = CGRect(x: 0, y: 0, width: frame.width, height: CGFloat(newHeight))
            }
        }
    }
}

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка цветов и стиля
        tabBar.backgroundColor = AppColors.background
        tabBar.tintColor = AppColors.accentOrange
        
        // Инициализация кастомного tabBar
        let customTabBar = CustomTabBar()
        setupTabBarItems()
    }
    
    init(tabBarControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        // Добавление контроллеров в таб бар
        self.viewControllers = tabBarControllers
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupTabBarItems() {
        guard let items = tabBar.items else { return }
        let imageOffset: CGFloat = -5  // Уменьшаем значение, если иконки слишком высоко
        let titleOffset: CGFloat = -3  // Настройте в зависимости от ваших потребностей

        items.forEach { item in
            item.imageInsets = UIEdgeInsets(top: imageOffset, left: 0, bottom: -imageOffset, right: 0)
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: titleOffset)
        }
    }

}
