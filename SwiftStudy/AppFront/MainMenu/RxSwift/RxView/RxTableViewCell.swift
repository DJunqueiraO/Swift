//
//  RxTableViewCell.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 26/12/22.
//

import UIKit

final class RxTableViewCell: UITableViewCell {
    var item: Chose? {
        didSet {
            label.text = item?.name
            jokenpoImageView.image = UIImage(named: item?.image ?? "")
        }
    }
    private lazy var label: UILabel = {
        let label = Create.element.label()
        label.textAlignment = .center
        return label
    }()
    private lazy var jokenpoImageView: UIImageView = {
        let jokenpoImageView = Create.element.imageView()
        jokenpoImageView.backgroundColor = .jokenpoPink
        return jokenpoImageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(_ cell: UITableViewCell,_ item: Chose) {
        let label = Create.element.label(item.name)
        label.textAlignment = .center
        let imageView = Create.element.imageView(UIImage(named: item.image ?? ""))
        imageView.backgroundColor = .jokenpoPink
    }
}

extension RxTableViewCell: Setup {
    func configure() {
        contentView.addSubviews([label, jokenpoImageView])
    }
    func constrain() {
        label.enableAutoLayout
            .constraint(attributes: [.top, .leading, .bottom])
            .constraint(attributesAttributes: [.trailing: .centerX])
        jokenpoImageView.enableAutoLayout
            .constraint(attributes: [.top, .trailing, .bottom])
            .constraint(attributesAttributes: [.leading: .centerX])
    }
}
