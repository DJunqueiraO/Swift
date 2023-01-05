//
//  DigimonTableView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import UIKit

final class DigimonsTableView: UITableView {
    var digimonsTableViewModel = DigimonsTableViewModel()
    let cellIdentifier = "Cell"
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DigimonsTableView: Setup {
    func configure() {
        register(DigimonTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        delegate = self
        dataSource = self
        digimonsTableViewModel.delegate = self
    }
}

extension DigimonsTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return digimonsTableViewModel.numberOfDigimons
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath) as? DigimonTableViewCell ?? DigimonTableViewCell()
        cell.setup(digimonsTableViewModel.getDigimon(indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.1
    }
}

extension DigimonsTableView: DigimonsTableViewModelDelegate {
    func digimonsTableViewModelDidGetData() {
        Task {
            reloadData()
        }
    }
}
