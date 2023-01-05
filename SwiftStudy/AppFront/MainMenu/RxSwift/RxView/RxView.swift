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
    private var rxViewModel = RxViewModel()
    private let player: (imageView: UIImageView, label: UILabel) = {
        let playerImageView = Create.element.imageView()
        playerImageView.backgroundColor = .jokenpoPink
        let playerLabel = UILabel()
        playerLabel.text = "Lero"
        return (imageView: playerImageView, label: playerLabel)
    }()
    private lazy var scoreStackView: UIStackView = {
        let scoreStackView = Create.element.stackView(arrangedSubviews: [player.label, cpu.label])
        scoreStackView.backgroundColor = .jokenpoPink
        return scoreStackView
    }()
    private let cpu: (imageView: UIImageView, label: UILabel) = {
        let cpuImageView = Create.element.imageView()
        cpuImageView.backgroundColor = .jokenpoPink
        let cpuLabel = UILabel()
        cpuLabel.text = " Lero"
        return (imageView: cpuImageView, label: cpuLabel)
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPurple
        let identifier = "Cell"
        rxViewModel.items.bind(to: tableView.rx.items(cellIdentifier: identifier)) {tableView, item, cell in
            guard let cell = cell as? RxTableViewCell else {return}
            cell.item = item
        }.disposed(by: rxViewModel.disposeBag)
        tableView.rx.setDelegate(self).disposed(by: rxViewModel.disposeBag)
        tableView.register(RxTableViewCell.self, forCellReuseIdentifier: identifier)
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
        addSubviews([tableView, player.imageView, scoreStackView, cpu.imageView])
    }
    func constrain() {
        tableView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.bottom: .centerY])
        player.imageView.enableAutoLayout
            .constraint(attributes: [.bottom, .leading], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.top: .centerY])
            .constraint(attribute: .width, multiplier: 1/3)
        scoreStackView.enableAutoLayout
            .constraint(attributes: [.bottom, .centerX], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.top: .centerY])
            .constraint(attribute: .width, multiplier: 1/3)
        cpu.imageView.enableAutoLayout
            .constraint(attributes: [.bottom, .trailing], to: safeAreaLayoutGuide)
            .constraint(attributesAttributes: [.top: .centerY])
            .constraint(attribute: .width, multiplier: 1/3)
    }
}

extension RxView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RxTableViewCell,
              let image = cell.item?.image else {return}
        player.imageView.image = UIImage(named: image)
        
        rxViewModel.items.bind {possibleChoses in
            let cpuChose = Int.random(in: 0...possibleChoses.count-1)
            guard let image = possibleChoses[cpuChose].image else {return}
            self.cpu.imageView.image = UIImage(named: image)
        }.disposed(by: rxViewModel.disposeBag)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.2
    }
}
