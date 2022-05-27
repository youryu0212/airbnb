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
    private var selectedDay: Day?
    private var selectedDateRange: ClosedRange<Date>?
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

    func setCalendar() {
        calendarView.daySelectionHandler = { [weak self] day in
            guard let self = self else { return }

            if self.selectedDateRange != nil {
                self.selectedDateRange = nil
                self.calendarView.setContent(self.makeContent())
            }
            self.selectedDay = day
            self.delegate?.didUpdateDay(day)
            let newContent = self.makeContent()
            self.calendarView.setContent(newContent)
        }
    }

    func setDateRange(_ dateRange: ClosedRange<Date>) {
        selectedDateRange = dateRange
        calendarView.setContent(makeContent())
        delegate?.didPresentDateRange(dateRange)
    }
}

private extension SelectCalendarView {
    func makeContent() -> CalendarViewContent {
        let calendar = Calendar.current

        let startDate = Date()
        let endDate = calendar.date(byAdding: DateComponents(year: 1), to: startDate) ?? Date()
        let mockDate = calendar.date(from: DateComponents(year: 1999, month: 05, day: 01)) ?? Date()
        var dateRangeToHighlight = mockDate...mockDate
        if let selectedDateRange = selectedDateRange {
            dateRangeToHighlight = selectedDateRange
        }

        return CalendarViewContent(calendar: calendar,
                                   visibleDateRange: startDate...endDate,
                                   monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
        .dayRangeItemProvider(for: [dateRangeToHighlight], { dayRangeLayoutContext in
            CalendarItemModel<DayRangeIndicatorView>(
                invariantViewProperties: .init(), viewModel: .init(framesOfDaysToHighlight: dayRangeLayoutContext.daysAndFrames.map { $0.frame })
            )
        })
        .dayItemProvider { [weak self] day in
            var invariantViewProperties = DayLabel.InvariantViewProperties(font: .systemFont(ofSize: 18), textColor: .darkGray, backgroundColor: .clear)

            if day == self?.selectedDay {
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
}

protocol SelectCalendarDelegate: AnyObject {
    func didUpdateDay(_ newDay: Day)
    func didPresentDateRange(_ dateRange: ClosedRange<Date>)
}
