//
//  UiView+.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/25.
//

import UIKit

extension UIView {
    func addSubViews(_ subViews: [UIView]) {
        subViews.forEach {
            self.addSubview($0)
        }
    }
}
