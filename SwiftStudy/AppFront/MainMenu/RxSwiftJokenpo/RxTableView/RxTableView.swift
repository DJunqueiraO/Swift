//
//  RxTableView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 16/01/23.
//

import UIKit

protocol RxTableViewDelegate: AnyObject {
    func rxTableView(didPlayed choses: (player: String, cpu: String))
}

final class RxTableView: UITableView {
    private var rxTableViewModel = RxTableViewModel()
    weak var rxTableViewDelegate: RxTableViewDelegate?
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RxTableView: Setup {
    func configure() {
        backgroundColor = .systemPurple
        let identifier = "Cell"
        rxTableViewModel.items.bind(to: rx.items(cellIdentifier: identifier)) {tableView, item, cell in
            guard let cell = cell as? RxTableViewCell else {return}
            cell.item = item
        }.disposed(by: rxTableViewModel.disposeBag)
        rx.setDelegate(self).disposed(by: rxTableViewModel.disposeBag)
        register(RxTableViewCell.self, forCellReuseIdentifier: identifier)
    }
}

extension RxTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RxTableViewCell else {return}
        guard let playerChose = cell.item?.image else {return}
        rxTableViewModel.items.bind {possibleChoses in
            let cpuChose = Int.random(in: 0...possibleChoses.count-1)
            guard let cpuChose = possibleChoses[cpuChose].image else {return}
            self.rxTableViewDelegate?.rxTableView(didPlayed: (playerChose, cpuChose))
        }.disposed(by: rxTableViewModel.disposeBag)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.2
    }
}
