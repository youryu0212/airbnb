//
//  Extension_Color.swift
//  Airbnb
//
//  Created by Kai Kim on 2022/05/24.
//

import UIKit
extension UIColor {
    static var gray1 = UIColor(named: "Gray1")
    static var gray2 = UIColor(named: "Gray2")
    static var gray3 = UIColor(named: "Gray3")
    static var gray4 = UIColor(named: "Gray4")
    static var gray5 = UIColor(named: "Gray5")
    static var gray6 = UIColor(named: "Gray6")
    static var primary = UIColor(named: "Primary")
    static var secondary = UIColor(named: "Secondary")
}

extension UIFont {

    static var largeRegular: UIFont {
        return UIFont.systemFont(ofSize: 34, weight: .regular)
    }

    static var mediumRegular: UIFont {
        return UIFont.systemFont(ofSize: 22, weight: .medium)
    }
    static var smallRegular: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .regular)
    }

    static var largeBold: UIFont {
        return UIFont.systemFont(ofSize: 34, weight: .semibold)
    }

    static var mediumBold: UIFont {
        return UIFont.systemFont(ofSize: 22, weight: .semibold)
    }
    static var smallBold: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .semibold)
    }

    static var caption: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .semibold)
    }

}
