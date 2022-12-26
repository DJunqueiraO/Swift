//
//  Video.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 14/12/22.
//

import Foundation

enum Section {case first}

struct Video: Hashable {
    static let creator = "Josicleison"
    let creatorSister = "Josicleide"
    var title: String
    var count: Int
    static func someTests() {
//        let swiftNews    = Video(title: "Swift News", count: 5000)
        let vlog         = Video(title: "Mc Donalds", count: 15000)
//        let tutorial     = Video(title: "UITableView Tutorial", count: 10000)
        print(Video.creator)
        print(vlog.creatorSister)
    }
}
