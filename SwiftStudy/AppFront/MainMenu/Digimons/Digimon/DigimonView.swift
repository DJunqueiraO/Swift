//
//  DigimonView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/01/23.
//

import UIKit

final class DigimonView: UIView {
    private let imageView = Create.element.imageView()
    private let label = Create.element.label()
    private lazy var stackView: UIStackView = {
        let stackView = Create.element.stackView(arrangedSubviews: [imageView, label])
        stackView.alignment = .center
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(_ digimon: Digimon) {
        label.text = "\(digimon.name ?? "")(\(digimon.level ?? ""))"
        Task {
            imageView.image = await digimon.img()
        }
    }
}

extension DigimonView: Setup {
    func configure() {
        backgroundColor = .white
        addSubview(stackView)
    }
    func constrain() {
        stackView.enableAutoLayout
            .constraint(attributes: [.centerX, .centerY, .width])
    }
}
