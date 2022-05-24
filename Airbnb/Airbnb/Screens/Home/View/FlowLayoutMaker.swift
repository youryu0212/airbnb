//
//  FlowLayoutMaker.swift
//  Airbnb
//
//  Created by Kai Kim on 2022/05/25.
//

import UIKit

// struct LayoutSize {
//    let itemSize : NSCollectionLayoutSize
//    let groupSize : NSCollectionLayoutSize
// }
//
// struct componentFactory {
//
//    var section: NSCollectionLayoutSection
//
//    func createComponents(section: Int) -> LayoutComponent {
//
//        let sectionTypes = LayoutComponent.Sections(rawValue: section)
//
//
//
//
//    }
//
// }
//
enum LayoutSection: Int {
    case banner = 0
    case localSite
    case randomSite

    //    var layoutSize : LayoutSize {
    //        switch self {
    //        case .banner:
    //            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
    //                                                          heightDimension: .fractionalHeight(1.0))
    //            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
    //                                                   heightDimension: .fractionalHeight(0.5))
    //            return LayoutSize(item: itemSize, group: groupSize)
    //
    //        case .localSite:
    //            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
    //                                                          heightDimension: .fractionalHeight(1.0))
    //            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
    //                                                   heightDimension: .fractionalHeight(0.3))
    //            return LayoutSize(item: itemSize, group: groupSize)
    //
    //        case .randomSite:
    //            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
    //                                                          heightDimension: .fractionalHeight(1.0))
    //            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
    //                                                   heightDimension: .fractionalHeight(0.6))
    //            return LayoutSize(item: itemSize, group: groupSize)
    //        }
    //    }
}

enum FlowLayout {

    static func makeCompositionalLayout () -> UICollectionViewCompositionalLayout {

        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in

            let section = LayoutSection.init(rawValue: sectionIndex)

            switch section {
            case .banner :
                // TODO: Factory Has to return group.
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.bottom = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                return  section

            case .localSite :
                // TODO: Factory Has to return group.
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.3))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.bottom = 10
                item.contentInsets.trailing = 10

                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(91)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
                section.contentInsets.leading = 10
                section.orthogonalScrollingBehavior = .groupPaging
                return  section

            case .randomSite :
                // TODO: Factory Has to return group.
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.6))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.bottom = 10
                item.contentInsets.trailing = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(124)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
                section.contentInsets.leading = 10
                
                section.orthogonalScrollingBehavior = .groupPaging
                return  section

            case .none:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)

                return  section

            }

        }

        return layout
    }

}
