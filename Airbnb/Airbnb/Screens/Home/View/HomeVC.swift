//
//  ViewController.swift
//  Airbnb
//
//  Created by Kai Kim on 2022/05/24.
//

import UIKit

class HomeViewController: UIViewController {

    private var searchBar: UISearchBar!
    private var homeCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDisplay()

    }

    private func configureDisplay() {
        setNavigationBar()
        setSearchBar()
        setCollectionView()
    }

    private func setNavigationBar() {
        self.view.backgroundColor = .gray6
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBar?.backgroundColor = .gray6
        navigationBarAppearance.shadowColor = .black
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
    }

    private func setSearchBar() {
        searchBar = UISearchBar()
        searchBar.placeholder = "어디로 여행가세요?"
        self.navigationItem.titleView = searchBar
    }

    private func setCollectionView() {
        let flowLayout = FlowLayout.makeCompositionalLayout()
        homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        homeCollectionView.dataSource = self
        homeCollectionView.register(testCell.self, forCellWithReuseIdentifier: testCell.id)
        homeCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.id)

        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(homeCollectionView)

        NSLayoutConstraint.activate([
            homeCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            homeCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            homeCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

}

extension HomeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 10
        } else {
            return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: testCell.id, for: indexPath) as? testCell else {return UICollectionViewCell()}
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.id, for: indexPath) as? SectionHeader else {
            return UICollectionReusableView()
        }

        return header
    }

}
