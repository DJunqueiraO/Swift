//
//  DigimonsFilterStackView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import UIKit

final class DigimonsFilterStackView: UIStackView {
    let filterNameTextField: UITextField = {
        let filterNameTextField = UITextField()
        filterNameTextField.backgroundColor = .weakDark
        return filterNameTextField
    }()
    let filterLevelTextField: UITextField = {
        let filterLevelTextField = UITextField()
        filterLevelTextField.backgroundColor = .weakDark
        return filterLevelTextField
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DigimonsFilterStackView: Setup {
    func configure() {
        addArrangedSubviews([filterNameTextField,
                             filterLevelTextField])
        distribution = .fillProportionally
    }
    func constrain() {
        filterLevelTextField.enableAutoLayout
            .constraint(attribute: .width, multiplier: 0.3)
    }
}
