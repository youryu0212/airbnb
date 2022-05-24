//
//  SearchView.swift
//  Airbnb
//
//  Created by 이건행 on 2022/05/24.
//

import UIKit

class SearchView: UICollectionReusableView {
    
    override init(frame: CGRect ){
        super.init(frame: frame)
        searchBar()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func searchBar() {
        //서치바 만들기
        let tempSearchBar = UISearchBar()
        tempSearchBar.placeholder = "어디로 여행가세요?"
        //네비게이션에 서치바
//        navigationController?.navigationBar.topItem?.titleView = tempSearchBar
        
        if let textfield = tempSearchBar.value(forKey: "searchField") as? UITextField {
            //서치바 백그라운드 컬러
            textfield.backgroundColor = UIColor.gray
            //플레이스홀더 글씨 색 정하기
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            //서치바 텍스트입력시 색 정하기
            textfield.textColor = UIColor.black
            //왼쪽 아이콘 이미지넣기
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                //이미지 틴트컬러 정하기
                leftView.tintColor = UIColor.white
            }
            //오른쪽 x버튼 이미지넣기
            if let rightView = textfield.rightView as? UIImageView {
                rightView.image = rightView.image?.withRenderingMode(.alwaysTemplate)
                //이미지 틴트 정하기
                rightView.tintColor = UIColor.white
            }
        }
    }
}
