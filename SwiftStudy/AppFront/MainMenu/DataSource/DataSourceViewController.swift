//
//  StaticViewController.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import UIKit

final class DataSourceViewController: UIViewController {
    private var videos: [Video] = {
        var videos = [Video]()
        for counter in 1...10 {
            let video = Video(title: "Lero \(counter)", count: counter)
            videos.append(video)
        }
        return videos
    }()
    private let tableView = DiffableDataSourceTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    @objc private func addVideo() {
        present(createActionSheet(), animated: true)
    }
    private func createActionSheet() -> UIAlertController {
        let actionSheet = Create.element.alert(title: "Lero", message: " Lero", cancelButtonTitle: "Cancel")
        for video in videos {
            actionSheet.addAction(
                UIAlertAction(title: video.title, style: .default) {[weak self]_ in
                    self?.tableView.videos.append(video)
                    self?.videos = self?.videos.filter{$0 != video} ?? []
                }
            )
        }
        return actionSheet
    }
}

extension DataSourceViewController: Setup {
    func configure() {
        title  = "Lero Lero"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .plus,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(addVideo))
        view.backgroundColor = .systemPurple
        view.addSubview(tableView)
    }
    func constrain() {
        tableView.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom], to: view.safeAreaLayoutGuide)
    }
}
