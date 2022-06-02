//
//  SearchBarDelegate.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/06/02.
//

import UIKit

final class SearchBarDelegate: NSObject, UISearchBarDelegate {
    // 검색창 입력을 끝냈을 때
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("검색 끝")
    }
    // cancel 버튼 누르면 호출
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel")
    }
    // 서치바의 검색어가 편집될때 호출
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("수정")
    }
}
