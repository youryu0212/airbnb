//
//  Day+.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/27.
//

import HorizonCalendar

extension Day {
    func toDate() -> Date {
        let calendar = Calendar.current
        return calendar.date(from: DateComponents(timeZone: .init(secondsFromGMT: 0), year: self.month.year, month: self.month.month, day: self.day)) ?? Date()
    }
}
