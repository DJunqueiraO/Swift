//
//  DataSourceTableView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 22/12/22.
//

import UIKit

final class DiffableDataSourceTableView: UITableView {
    var videos: [Video] = [] {
        didSet {
            reloadDiffableData()
        }
    }
    private lazy var diffableDataSource: UITableViewDiffableDataSource<Section, Video> = UITableViewDiffableDataSource(tableView: self) {tableView, indexPath, video -> UITableViewCell? in
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath)
        let label = Create.element.label(video.title)
        cell.contentView.addSubview(label)
        label.enableAutoLayout
            .constraint(attributes: [.centerY, .centerX])
        return cell
    }
    private let identifier = "Cell"
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func reloadDiffableData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Video>()
        snapShot.appendSections([.first])
        snapShot.appendItems(videos)
        diffableDataSource.apply(snapShot, animatingDifferences: true)
    }
}

extension DiffableDataSourceTableView: Setup {
    func configure() {
        backgroundColor = .reverseDark
        register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        delegate = self
        isUserInteractionEnabled = false
    }
}

extension DiffableDataSourceTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.1
    }
}
