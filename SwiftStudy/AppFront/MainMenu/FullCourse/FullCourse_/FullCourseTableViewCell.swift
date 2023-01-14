//
//  FullCourseTableViewCell.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 12/01/23.
//

import UIKit

final class FullCourseTableViewCell: UITableViewCell {
    private let label = Create.element.label()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(text: String) {
        label.text = text
    }
}

extension FullCourseTableViewCell: Setup {
    func configure() {
        contentView.addSubview(label)
    }
    func constrain() {
        label.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom])
    }
}
