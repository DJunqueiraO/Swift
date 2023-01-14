//
//  DigimonViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/01/23.
//

import UIKit

final class DigimonViewController: UIViewController {
    private let digimonView = DigimonView()
    init(_ digimon: Digimon) {
        super.init(nibName: nil, bundle: nil)
        digimonView.setup(digimon)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension DigimonViewController: Setup {
    func configure() {
        view = digimonView
    }
}
