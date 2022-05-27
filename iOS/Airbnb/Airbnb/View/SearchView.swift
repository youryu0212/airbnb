//
//  SearchView.swift
//  Airbnb
//
//  Created by 이건행 on 2022/05/24.
//

import UIKit

class HomeView: UIView {
    
    override init(frame: CGRect ){
        super.init(frame: frame)
        appendSubView()
        scrollConfiguration()
        setUpUIConfiguration()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private(set) var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mainExplain: UILabel = {
        let maintext = UILabel()
        maintext.numberOfLines = 0
        let font = UIFont(name: "Helvetica", size: 34)
        let attributedString = NSMutableAttributedString(string: "슬기로운\n자연생활")
        let length = attributedString.length
        attributedString.addAttributes([.foregroundColor:UIColor.black,
                                        .font:UIFont.systemFont(ofSize: 34, weight: .bold)],
                                       range: NSRange(location: 0, length: 9))
        maintext.attributedText = attributedString
        
        return maintext
    }()
    
    let mainImageView: UIImageView = {
        let mainImage = UIImageView()
        mainImage.image = UIImage(named: "mainImage")
        return mainImage
    }()
    
    func appendSubView() {
        self.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        
        contentView.addSubview(mainImageView)
        contentView.addSubview(mainExplain)
    }
    
    
    func scrollConfiguration() {
        contentScrollView.contentLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        contentScrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contentScrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contentScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    private func setUpUIConfiguration() {
        contentView.topAnchor.constraint(equalTo: contentScrollView.safeAreaLayoutGuide.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: contentScrollView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: contentScrollView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: contentScrollView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentScrollView.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        mainExplain.translatesAutoresizingMaskIntoConstraints = false
        mainExplain.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24).isActive = true
        mainExplain.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
    }
    
    
}
