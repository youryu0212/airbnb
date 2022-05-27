//
//  Date+.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/27.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월 d일"
        return dateFormatter.string(from: self)
    }
}
