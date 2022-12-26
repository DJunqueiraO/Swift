//
//  FakeBookPostPerfilStackView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 20/12/22.
//

import UIKit

final class FakeBookPostPerfilStackView: UIStackView {
    lazy var perfilButton = FakeBookPerfilButton()
    lazy var perfilName: (stackView: UIStackView, label: UILabel) = {
        let perfilNameLabel = Create.element.label()
        let perfilNameStackView = UIStackView(arrangedSubviews: [perfilNameLabel])
        perfilNameStackView.axis = .vertical
        return (stackView: perfilNameStackView, label: perfilNameLabel)
    }()
    lazy var plusButton: UIButton = {
        let plusButton = Create.element.button(image: .plus)
        plusButton.tintColor = .lightGray
        return plusButton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FakeBookPostPerfilStackView: Setup {
    func configure() {
        addArrangedSubviews([perfilButton, perfilName.stackView, plusButton])
    }
    func constrain() {
        plusButton.imageView?.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY])
            .shape(size: screen.width*0.1)
    }
}
