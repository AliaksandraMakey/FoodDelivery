//
//  ViewController.swift
//  FoodDelivery
//
//  Created by Александра Макей on 23.03.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello World"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20),
                                     ])
        label.font = .Roboto.bold.size(of: 40)
        label.textColor = AppColors.accentOrange
        view.backgroundColor = AppColors.background
        
    }


}

