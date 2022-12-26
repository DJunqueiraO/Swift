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
    private let items = Observable.just(["Potato", "Banana", "Carrot", "Tomato"])
    private let disposeBag = DisposeBag()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemPurple
        let identifier = "Cell"
        items.bind(to: tableView.rx.items(cellIdentifier: identifier)) {tableView, item, cell in
            let label = Create.element.label(item)
            cell.contentView.addSubview(label)
            label.enableAutoLayout
                .constraint(attributes: [.centerY, .centerX])
        }.disposed(by: disposeBag)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: identifier)
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
        addSubview(tableView)
    }
    func constrain() {
        tableView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom], to: safeAreaLayoutGuide)
    }
}

extension RxView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.1
    }
}
