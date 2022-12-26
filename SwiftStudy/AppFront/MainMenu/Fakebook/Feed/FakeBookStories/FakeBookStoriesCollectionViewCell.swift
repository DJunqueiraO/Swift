//
//  FakeBookStoriesCollectionViewCell.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookStoriesCollectionViewCell: UICollectionViewCell {
    private lazy var imageView = UIImageView()
    private lazy var label = Create.element.label()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubviews([imageView, label])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupAsPerfilStory(_ fakeBookStory: FakeBookStory) {
        if let image = fakeBookStory.image {imageView.image = UIImage(named: image)}
        imageView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing])
            .constraint(attribute: .height, multiplier: 0.6)
        let button = UIImageView(image: .plus)
        button.tintColor = .label
        button.backgroundColor = .reverseDark
        contentView.addSubview(button)
        button.enableAutoLayout
            .constraint(attributesAttributes: [.centerY: .bottom, .centerX: .centerX],
                        to: imageView)
            .constraint(attributesAttributes: [.height: .height, .width: .height], multiplier: 0.2)
        button.layer.cornerRadius = frame.height*0.1
        label.text = fakeBookStory.name
        label.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom])
        label.textColor = .black
    }
    func setupStory(_ fakeBookStory: FakeBookStory) {
        if let image = fakeBookStory.image {imageView.image = UIImage(named: image)}
        imageView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
        label.text = fakeBookStory.name
        label.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom])
        label.textColor = .white
    }
}

