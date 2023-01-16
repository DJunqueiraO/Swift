//
//  RxViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/12/22.
//

import UIKit

final class JokenpoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension JokenpoViewController: Setup {
    func configure() {
        view = RxView()
    }
}
