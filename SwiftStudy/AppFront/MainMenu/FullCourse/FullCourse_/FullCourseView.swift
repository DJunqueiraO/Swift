//
//  FullCourseView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 12/01/23.
//

import UIKit

final class FullCourseView: UIView {
    let tableView = FullCourseTableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FullCourseView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        addSubview(tableView)
    }
    func constrain() {
        tableView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom], to: safeAreaLayoutGuide)
    }
}
