//
//  FakeBookStatusStackView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookStatusStackView: UIView {
    var perfilImage: UIImage? = nil {
        didSet {
            perfilButton.setImage(perfilImage, for: .normal)
        }
    }
    private lazy var perfilButton = FakeBookPerfilButton()
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .weakDark
        statusTextField.layer.cornerRadius = frame.height*0.025
        return statusTextField
    }()
    private lazy var galeryStackView: UIStackView = {
        let galleryButton = Create.element.button("Foto")
        let galleryIcon = UIImageView(image: .gallery)
        galleryIcon.contentMode = .scaleAspectFit
        let galeryStackView = UIStackView(
            arrangedSubviews: [galleryIcon, galleryButton]
        )
        galeryStackView.axis = .vertical
        return galeryStackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeBookStatusStackView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        addSubviews([perfilButton, statusTextField, galeryStackView])
    }
    func constrain() {
        perfilButton.enableAutoLayout
            .constraint(attributes: [.leading, .centerY])
            .constraint(attributesMultipliers: [.height: 0.9, .width: 0.2])
        statusTextField.enableAutoLayout
            .constraint(attributes: [.centerY, .centerX])
            .constraint(attributes: [.height, .width], multiplier: 0.6)
        galeryStackView.enableAutoLayout
            .constraint(attributes: [.centerY, .trailing])
            .constraint(attribute: .width, multiplier: 0.2)
    }
}
