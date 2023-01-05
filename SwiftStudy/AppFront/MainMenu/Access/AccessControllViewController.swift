//
//  AccessControllViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

final class AccessViewController: UIViewController {
//    fileprivate func printLero() {
//        print("Lero Lero")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        FilePrivateObject().callLero()
        setup()
    }
}

extension AccessViewController: Setup {
    func configure() {
        view.backgroundColor = .green
    }
}
