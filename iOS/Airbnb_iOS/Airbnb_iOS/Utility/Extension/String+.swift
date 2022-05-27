//
//  String+.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/27.
//

import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self) ?? Date()
    }
}
