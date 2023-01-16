//
//  RxView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/12/22.
//

import UIKit
import RxSwift
import RxCocoa

final class RxView: UIView, UIScrollViewDelegate {
    private let playerImageView: UIImageView = {
        let playerImageView = Create.element.imageView()
        playerImageView.backgroundColor = .jokenpoPink
        return playerImageView
    }()
    private let cpuImageView: UIImageView = {
        let cpuImageView = Create.element.imageView()
        cpuImageView.backgroundColor = .jokenpoPink
        return cpuImageView
    }()
    private lazy var scoreStackView = RxStackView()
    private lazy var tableView: RxTableView = {
        let tableView = RxTableView()
        tableView.rxTableViewDelegate = self
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RxView: Setup {
    func configure() {
        backgroundColor = .magenta
        addSubviews([tableView, playerImageView, scoreStackView, cpuImageView])
    }
    func constrain() {
        tableView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.bottom: .centerY])
        playerImageView.enableAutoLayout
            .constraint(attributes: [.bottom, .leading], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.top: .centerY])
            .constraint(attribute: .width, multiplier: 1/3)
        scoreStackView.enableAutoLayout
            .constraint(attributes: [.bottom, .centerX], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.top: .centerY])
            .constraint(attribute: .width, multiplier: 1/3)
        cpuImageView.enableAutoLayout
            .constraint(attributes: [.bottom, .trailing], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.top: .centerY])
            .constraint(attribute: .width, multiplier: 1/3)
    }
}

extension RxView: RxTableViewDelegate {
    func rxTableView(didPlayed chose: (player: String, cpu: String)) {
        playerImageView.image = UIImage(named: chose.player)
        cpuImageView.image = UIImage(named: chose.cpu)
        guard let player = Int(chose.player), let cpu = Int(chose.cpu) else {return}
        Jokenpo.play(player: player, cpu: cpu)
        scoreStackView.updateScore(wins: Jokenpo.getWins,
                                   draw: Jokenpo.getDraws,
                                   lose: Jokenpo.getLoses)
    }
}
