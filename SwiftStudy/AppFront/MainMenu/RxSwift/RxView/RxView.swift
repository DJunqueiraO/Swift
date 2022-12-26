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
    private let rxViewModel = RxViewModel()
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
