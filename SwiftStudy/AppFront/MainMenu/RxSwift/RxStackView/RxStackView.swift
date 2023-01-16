//
//  RxStackView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/01/23.
//

import UIKit

final class RxStackView: UIStackView {
    private let winsLabel = Create.element.label("Wins", textAlignment: .center)
    private let deawLabel = Create.element.label("Draw", textAlignment: .center)
    private let loseLabel = Create.element.label("Lose", textAlignment: .center)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateScore(wins: Int, draw: Int, lose: Int) {
        winsLabel.text = "Wins: \(wins)"
        deawLabel.text = "Draw: \(draw)"
        loseLabel.text = "Lose: \(lose)"
    }
}

extension RxStackView: Setup {
    func configure() {
        addArrangedSubviews([winsLabel, deawLabel, loseLabel])
        backgroundColor = .magenta
        distribution = .fillEqually
        axis = .vertical
    }
}
