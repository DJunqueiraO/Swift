//
//  DigimonsViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import UIKit

final class DigimonsViewController: UIViewController {
    private let digimonsView = DigimonsView()
    override func loadView() {
        super.loadView()
        setup()
    }
}

extension DigimonsViewController: Setup {
    func configure() {
        view = digimonsView
        digimonsView.digimonsTableView.digimonsTableViewDelegate = self
    }
}

extension DigimonsViewController: DigimonsTableViewDelegate {
    func digimonsTableView(didSelect digimon: Digimon) {
        navigationController?.navigate(to: DigimonViewController(digimon))
    }
}
