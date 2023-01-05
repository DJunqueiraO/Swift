//
//  DigimonsView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import UIKit

final class DigimonsView: UIView {
    private let filterStackView = DigimonsFilterStackView()
    private let tableView = DigimonsTableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func filterNameTextFieldTarget(_ sender: UITextField) {
        
    }
}

extension DigimonsView: Setup {
    func configure() {
        addSubviews([filterStackView, tableView])
        filterStackView.filterNameTextField.addTarget(self,
                                                      action: #selector(filterNameTextFieldTarget),
                                                      for: .editingChanged)
    }
    func constrain() {
        filterStackView.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .top], to: safeAreaLayoutGuide)
            .constraint(attribute: .height, to: safeAreaLayoutGuide, multiplier: 0.1)
        tableView.enableAutoLayout
            .constraint(attributes: [.leading, .trailing, .bottom], to: safeAreaLayoutGuide)
            .constraint(attribute: .height, to: safeAreaLayoutGuide, multiplier: 0.9)
    }
}
