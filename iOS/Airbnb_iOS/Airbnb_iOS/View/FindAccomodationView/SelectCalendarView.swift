//
//  SelectCalendarView.swift
//  Airbnb_iOS
//
//  Created by 김한솔 on 2022/05/25.
//

import UIKit
import HorizonCalendar

final class SelectCalendarView: UIView {

    private lazy var calendarView = CalendarView(initialContent: makeContent())
    private var selectedDay1: Day?
    private var selectedDay2: Day?
    weak var delegate: SelectCalendarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setUpLayout()
        setCalendar()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}

private extension SelectCalendarView {
    func makeContent() -> CalendarViewContent {
        let calendar = Calendar.current

        let startDate = calendar.date(from: DateComponents(year: 2022, month: 05, day: 01)) ?? Date()
        let endDate = calendar.date(from: DateComponents(year: 2022, month: 12, day: 31)) ?? Date()
        let mockDate = calendar.date(from: DateComponents(year: 1999, month: 05, day: 01)) ?? Date()
        var dateRangeToHighlight = mockDate...mockDate
        if let selectedDay1 = selectedDay1, let selectedDay2 = selectedDay2 {
            let date1 = calendar.date(from: DateComponents(year: selectedDay1.month.year, month: selectedDay1.month.month, day: selectedDay1.day)) ?? Date()
            let date2 = calendar.date(from: DateComponents(year: selectedDay2.month.year, month: selectedDay2.month.month, day: selectedDay2.day)) ?? Date()
            let min = [date1, date2].min() ?? date1
            let max = [date1, date2].max() ?? date2
            dateRangeToHighlight = min...max
            delegate?.didSetDate(dateRangeToHighlight)
        }

        return CalendarViewContent(calendar: calendar,
                                   visibleDateRange: startDate...endDate,
                                   monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
        .dayItemProvider { day in
            CalendarItemModel<DayLabel>(invariantViewProperties: .init(font: .systemFont(ofSize: 18),
                                                                       textColor: .darkGray, backgroundColor: .clear),
                                        viewModel: .init(day: day)
            )
        }
        .dayRangeItemProvider(for: [dateRangeToHighlight], { dayRangeLayoutContext in
            CalendarItemModel<DayRangeIndicatorView>(
                invariantViewProperties: .init(), viewModel: .init(framesOfDaysToHighlight: dayRangeLayoutContext.daysAndFrames.map { $0.frame })
            )
        })
        .verticalDayMargin(8)
        .dayItemProvider { [weak self] day in
            var invariantViewProperties = DayLabel.InvariantViewProperties(font: .systemFont(ofSize: 18), textColor: .darkGray, backgroundColor: .clear)

            if day == self?.selectedDay1 {
                invariantViewProperties.textColor = .white
                invariantViewProperties.backgroundColor = .black
            }

            return CalendarItemModel<DayLabel>(
                invariantViewProperties: invariantViewProperties, viewModel: .init(day: day)
            )
        }
    }

    func setUpLayout() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(calendarView)

        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendarView.topAnchor.constraint(equalTo: topAnchor),
            calendarView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setCalendar() {
        calendarView.daySelectionHandler = { [weak self] day in
            guard let self = self else { return }

            if self.selectedDay1 != nil {
                self.selectedDay2 = day
            } else {
                self.selectedDay1 = day
            }
            let newContent = self.makeContent()
            self.calendarView.setContent(newContent)
        }
    }
}

protocol SelectCalendarDelegate: AnyObject {
    func didSetDate(_ dateRange: ClosedRange<Date>?)
}
