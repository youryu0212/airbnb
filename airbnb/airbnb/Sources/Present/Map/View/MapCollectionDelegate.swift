//
//  MapCollectionDelegate.swift
//  airbnb
//
//  Created by 김동준 on 2022/05/23.
//

import UIKit

final class MapCollectionDelegate: NSObject {
    
}
extension MapCollectionDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let insetX = (collectionView.bounds.width - (collectionView.bounds.width - 60)) / 2.0
        let insetY = (collectionView.bounds.height - 120) / 2.0
        return UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
       // let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        print("check \(scrollView.frame)")
        let cellWidthIncludingSpacing = scrollView.frame.width - 60 + 15
        // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        var roundedIndex = round(index)
        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)
        } else {
            roundedIndex = ceil(index)
        }
        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        //offset = CGPoint(x: 580, y: 0) 290, 580, 0
        print("offset \(offset)")
        targetContentOffset.pointee = offset
        scrollView.layoutIfNeeded()
    }
}
