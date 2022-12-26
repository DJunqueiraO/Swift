//
//  FakeBookCollectionView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookNavigationCollectionView: UICollectionView {
    private let identifier = "Cell"
    private var imageNames: [String] = [] {
        didSet {
            reloadData()
        }
    }
    init(imageNames: [String]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
        self.imageNames = imageNames
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeBookNavigationCollectionView: Setup {
    func configure() {
        delegate = self
        dataSource = self
        register(FakeBookNavigationCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
}

extension FakeBookNavigationCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        guard let cell = cell as? FakeBookNavigationCollectionViewCell else {return cell}
        cell.image = imageNames[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height,
                      height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.height*0.2
    }
}
