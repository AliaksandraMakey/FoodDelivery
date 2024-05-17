//
//  UIFonts+Extensions.swift
//  FoodDelivery
//
//  Created by Александра Макей on 17.05.2024.
//

import UIKit

extension UIFont {
    enum Roboto {
        enum medium {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.medium, size: size)!
            }
        }
        enum light {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.light, size: size)!
            }
        }
        enum regular {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.regular, size: size)!
            }
        }
        enum mediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.mediumItalic, size: size)!
            }
        }
        enum thinItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.thinItalic, size: size)!
            }
        }
        enum boldltalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.boldltalic, size: size)!
            }
        }
        enum lightItalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.lightItalic, size: size)!
            }
        }
        enum italic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.italic, size: size)!
            }
        }
        enum blackltalic {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.blackltalic, size: size)!
            }
        }
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.bold, size: size)!
            }
        }
        enum thin {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.thin, size: size)!
            }
        }
        enum black {
            static func size(of size: CGFloat) -> UIFont {
                return UIFont(name: Constants.Roboto.black, size: size)!
            }
        }
    }
}
private extension UIFont {
    enum Constants {
        enum Roboto {
            static let medium = "Roboto-Medium"
            static let light = "Roboto-Light"
            static let regular = "Roboto-Regular"
            static let mediumItalic = "Roboto-MediumItalic"
            static let thinItalic = "Roboto-ThinItalic"
            static let boldltalic = "Roboto-Boldltalic"
            static let lightItalic = "Roboto-LightItalic"
            static let italic = "Roboto-Italic"
            static let blackltalic = "Roboto-Blackltalic"
            static let bold = "Roboto-Bold"
            static let thin = "Roboto-Thin"
            static let black = "Roboto-Black"
        }
    }
}
