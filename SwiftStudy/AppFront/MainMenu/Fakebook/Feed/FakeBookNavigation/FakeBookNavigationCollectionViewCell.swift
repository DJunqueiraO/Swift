//
//  FakeBookCollectionViewCell.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookNavigationCollectionViewCell: UICollectionViewCell {
    lazy var image: String = String() {
        didSet {
            imageView.image = UIImage(systemName: image)
        }
    }
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                imageView.image = UIImage(systemName: image + ".fill")
            } else {
                imageView.image = UIImage(systemName: image)
            }
        }
    }
}

extension FakeBookNavigationCollectionViewCell: Setup {
    func configure() {
        contentView.addSubview(imageView)
    }
    func constrain() {
        imageView.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .constraint(attributesMultipliers: [.height: 0.5, .width: 0.55])
    }
}
