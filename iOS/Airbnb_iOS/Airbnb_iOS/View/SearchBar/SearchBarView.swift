//
//  SearchBarView.swift
//  Airbnb_iOS
//
//  Created by juntaek.oh on 2022/05/25.
//

import UIKit

class SearchBarView: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.placeholder = "어디로 여행가세요?"
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}
