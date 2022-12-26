//
//  Facebook.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookViewController: UIViewController {
    private lazy var fakeBookView: FakeBookView = {
        let fakeBookView = FakeBookView(frame: view.frame)
        fakeBookView.delegate = self
        return fakeBookView
    }()
    private lazy var rightBarButtonItems: [UIBarButtonItem] = {
        let search = UIBarButtonItem()
        search.image = .search
        let configuration = UIBarButtonItem()
        configuration.image = .lines
        return [configuration, search]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension FakeBookViewController: Setup {
    func configure() {
        view = fakeBookView
        title = "\(type(of: self))".removeLast(13)
        navigationItem.rightBarButtonItems = rightBarButtonItems
    }
}

extension FakeBookViewController: FakeBookViewDelegate {
    func fakeBookView(willComment post: FakeBookPost?) -> UIAction? {
        return UIAction {_ in
            self.navigationController?.navigate(to: CommentViewController(post))
        }
    }
}
