//
//  UIImage.swift
//  FoodDelivery
//
//  Created by Александра Макей on 26.05.2024.
//

import UIKit

extension UIImage {
    func scaledImage(scale: CGFloat) -> UIImage? {
        let newSize = CGSize(width: self.size.width * scale, height: self.size.height * scale)
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

