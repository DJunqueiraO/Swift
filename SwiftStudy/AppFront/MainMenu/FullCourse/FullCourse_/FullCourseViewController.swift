//
//  FullCourseViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 12/01/23.
//

import UIKit

final class FullCourseViewController: UIViewController {
    private let fullCourseView: FullCourseView = {
        let fullCourseView = FullCourseView()
        return fullCourseView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension FullCourseViewController: Setup {
    func configure() {
        view = fullCourseView
        fullCourseView.tableView.fullCourseTableViewDelegate  = self
    }
}

extension FullCourseViewController: FullCourseTableViewDelegate {
    func fullCourseTableView(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
