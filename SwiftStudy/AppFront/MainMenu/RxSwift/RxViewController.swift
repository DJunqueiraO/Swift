//
//  RxViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/12/22.
//

import UIKit

final class RxViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension RxViewController: Setup {
    func configure() {
        view = RxView()
    }
}
