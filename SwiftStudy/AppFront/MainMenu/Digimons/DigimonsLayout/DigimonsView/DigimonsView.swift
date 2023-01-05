//
//  DigimonsView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import UIKit

final class DigimonsView: UIView {
    private let filterStackView = DigimonsFilterStackView()
    private let digimonsTableView = DigimonsTableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc private func filterNameTextFieldTarget(_ sender: UITextField) {
        digimonsTableView.filter(name: sender.text)
    }
    @objc private func filterLevelTextFieldTarget(_ sender: UITextField) {
        digimonsTableView.filter(level: sender.text)
    }
}

extension DigimonsView: Setup {
    func configure() {
        addSubviews([filterStackView, digimonsTableView])
        filterStackView.filterNameTextField.addTarget(self, action: #selector(filterNameTextFieldTarget),
                                                      for: .editingChanged)
        filterStackView.filterLevelTextField.addTarget(self, action: #selector(filterLevelTextFieldTarget),
                                                       for: .editingChanged)
    }
    func constrain() {
        filterStackView.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .top], to: safeAreaLayoutGuide)
            .constraint(attribute: .height, to: safeAreaLayoutGuide, multiplier: 0.1)
        digimonsTableView.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom], to: safeAreaLayoutGuide)
            .constraint(attribute: .height, to: safeAreaLayoutGuide, multiplier: 0.9)
    }
}
