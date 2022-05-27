//
//  DayLabel.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/25.
//

import UIKit
import HorizonCalendar

struct DayLabel: CalendarItemViewRepresentable {

    // Properties that are set once when we initialize the view.
    struct InvariantViewProperties: Hashable {
        let font: UIFont
        var textColor: UIColor
        var backgroundColor: UIColor
    }

    // Properties that will vary depending on the particular date being displayed.
    struct ViewModel: Equatable {
        let day: Day
    }

    static func makeView(withInvariantViewProperties invariantViewProperties: InvariantViewProperties) -> UILabel {
        let label = UILabel()

        label.backgroundColor = invariantViewProperties.backgroundColor
        label.font = invariantViewProperties.font
        label.textColor = invariantViewProperties.textColor

        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 27

        return label
    }

    static func setViewModel(_ viewModel: ViewModel, on view: UILabel) {
        view.text = "\(viewModel.day.day)"
    }
}
