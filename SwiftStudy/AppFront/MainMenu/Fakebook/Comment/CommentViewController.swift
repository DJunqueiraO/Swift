//
//  CommentViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 23/12/22.
//

import UIKit

final class CommentViewController: UIViewController {
    private let postStackView = FakeBookPostStackView()
    init(_ post: FakeBookPost?) {
        super.init(nibName: nil, bundle: nil)
        postStackView.post = post
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension CommentViewController: Setup {
    func configure() {
        title = "\(type(of: self))".removeLast(13)
        view.backgroundColor = .reverseDark
        view.addSubview(postStackView)
    }
    func constrain() {
        postStackView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing], to: view.safeAreaLayoutGuide)
    }
}
