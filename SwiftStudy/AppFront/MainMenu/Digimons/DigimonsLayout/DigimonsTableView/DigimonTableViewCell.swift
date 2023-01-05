//
//  DigimonsTableViewCell.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import UIKit

final class DigimonTableViewCell: UITableViewCell {
    private let digimonImageView: UIImageView = {
        let digimonImageView = UIImageView()
        digimonImageView.contentMode = .scaleAspectFit
        return digimonImageView
    }()
    private let digimonNameLabel: UILabel = {
        let digimonNameLabel = Create.element.label()
        return digimonNameLabel
    }()
    private let digimonLevelLabel: UILabel = {
        let digimonLevelLabel = Create.element.label()
        return digimonLevelLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    func setup(_ digimon: Digimon) {
        digimonNameLabel.text = digimon.name
        digimonLevelLabel.text = digimon.level
        Task {
            digimonImageView.image = await digimon.img()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DigimonTableViewCell: Setup {
    func configure() {
        contentView.addSubviews([digimonImageView, digimonNameLabel, digimonLevelLabel])
    }
    func constrain() {
        digimonImageView.enableAutoLayout
            .constraint(attributes: [.leading, .top, .bottom])
            .constraint(attribute: .width, multiplier: 0.2)
        digimonNameLabel.enableAutoLayout
            .constraint(attributes: [.top, .bottom])
            .constraint(attributesAttributes: [.leading: .trailing], to: digimonImageView)
            .constraint(attributesAttributes: [.trailing: .leading], to: digimonLevelLabel)
        digimonLevelLabel.enableAutoLayout
            .constraint(attributes: [.trailing, .top, .bottom])
            .constraint(attribute: .width, multiplier: 0.3)
    }
}
