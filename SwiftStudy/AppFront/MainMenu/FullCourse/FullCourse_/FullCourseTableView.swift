//
//  FullCourseTableView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 12/01/23.
//

import UIKit

protocol FullCourseTableViewDelegate: AnyObject {
    func fullCourseTableView(_ viewController: UIViewController)
}

final class FullCourseTableView: UITableView {
    weak var fullCourseTableViewDelegate: FullCourseTableViewDelegate?
    private var viewControllers: [UIViewController] = [Exercice_1ViewController()]
    private static let cellIdentifier = "Cell"
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FullCourseTableView: Setup {
    func configure() {
        delegate = self
        dataSource = self
        register(FullCourseTableViewCell.self,
                 forCellReuseIdentifier: FullCourseTableView.cellIdentifier)
    }
}

extension FullCourseTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fullCourseTableViewDelegate?.fullCourseTableView(viewControllers[indexPath.row])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FullCourseTableView.cellIdentifier,
                                                 for: indexPath) as? FullCourseTableViewCell ?? FullCourseTableViewCell()
        cell.setup(text: "\t\(type(of: viewControllers[indexPath.row]))".removeLast(13))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.1
    }
}
