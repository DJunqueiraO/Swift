//
//  CallViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 29/12/22.
//

import UIKit

final class CallViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension CallViewController: Setup {
    func configure() {
        view.backgroundColor = .jokenpoPink
    }
}
