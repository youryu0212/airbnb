//
//  ScrollableView.swift
//  AirBnb
//
//  Created by 송태환 on 2022/05/25.
//

import UIKit

public class ScrollableView: UIScrollView {
  public enum ScrollDirection {
    case horizontal
    case vertical
    case `default`
  }

  public let contentView = UIView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configure()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.configure()
  }

  private func configure() {
    self.addSubview(self.contentView)
    self.contentView.topAnchor.constraint(equalTo: self.contentLayoutGuide.topAnchor).isActive = true
    self.contentView.bottomAnchor.constraint(equalTo: self.contentLayoutGuide.bottomAnchor).isActive = true
    self.contentView.leadingAnchor.constraint(equalTo: self.contentLayoutGuide.leadingAnchor).isActive = true
    self.contentView.trailingAnchor.constraint(equalTo: self.contentLayoutGuide.trailingAnchor).isActive = true
    self.setDirectionConstraint(direction: .vertical)
  }

  public func setDirectionConstraint(direction: ScrollDirection, offset: CGFloat = 0) {
    switch direction {
    case .horizontal:
      self.contentView.heightAnchor.constraint(
        equalTo: self.frameLayoutGuide.heightAnchor,
        constant: offset
      ).isActive = true
    default:
      self.contentView.widthAnchor.constraint(
        equalTo: self.frameLayoutGuide.widthAnchor,
        constant: offset
      ).isActive = true
    }
  }

  /**
   컨텐츠 Wrapper View 에 View 추가
   */
  public func addContent(_ view: UIView) {
    self.contentView.addSubview(view)
  }
}
