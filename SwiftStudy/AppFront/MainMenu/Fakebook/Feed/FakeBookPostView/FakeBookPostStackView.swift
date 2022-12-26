//
//  FakeBookPostView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/12/22.
//

import UIKit

final class FakeBookPostStackView: UIStackView {
    var post: FakeBookPost? = nil {
        didSet {
            if let image = post?.perfilImage {
                perfilStackView.perfilButton.setImage(UIImage(named: image), for: .normal)
            }
            perfilStackView.perfilName.label.text = post?.name
            if let image = post?.image,
               let postImage = UIImage(named: image) {createPostContentImageView(postImage)}
            postContent.label.text = post?.description
        }
    }
    private lazy var perfilStackView = FakeBookPostPerfilStackView()
    private lazy var postContent: (stackView: UIStackView, label: UILabel) = {
        let descriptionLabel = Create.element.label()
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        let descriptionStackView = UIStackView(arrangedSubviews: [descriptionLabel])
        descriptionStackView.axis = .vertical
        descriptionStackView.isLayoutMarginsRelativeArrangement = true
        descriptionStackView.layoutMargins = UIEdgeInsets(top: frame.width*0.025,
                                                          left: frame.width*0.025,
                                                          bottom: frame.width*0.025,
                                                          right:  frame.width*0.025)
        let postContentStackView = UIStackView(arrangedSubviews: [descriptionStackView])
        postContentStackView.axis = .vertical
        return (stackView: postContentStackView, label: descriptionLabel)
    }()
    lazy var buttonsStackView = FakeBookPostButtonsStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createPostContentImageView(_ image: UIImage) {
        let postContentImageView = Create.element.imageView(image)
        postContent.stackView.addArrangedSubview(postContentImageView)
        postContentImageView.enableAutoLayout
            .constraint(attributesAttributes: [.height: .width])
    }
}

extension FakeBookPostStackView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        axis = .vertical
        addArrangedSubviews([perfilStackView, postContent.stackView, buttonsStackView])
    }
    func constrain() {
        perfilStackView.perfilButton.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
            .constraint(attributesAttributes: [.height: .width], multiplier: 0.2)
        perfilStackView.plusButton.enableAutoLayout.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.2)
    }
}
