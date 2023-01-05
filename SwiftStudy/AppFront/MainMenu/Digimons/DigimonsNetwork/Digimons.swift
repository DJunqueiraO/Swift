//
//  Digimon.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 05/01/23.
//

import UIKit

struct Digimon: Codable {
    let name, img, level: String?
    func getImage() async -> UIImage? {
        guard let link = img else {return nil}
        guard let data = await Network.get(from: URL(string: link))?.data else {return nil}
        return UIImage(data: data)
    }
}

typealias Digimons = [Digimon]

//{"name":"Yokomon","img":"https://digimon.shadowsmith.com/img/yokomon.jpg","level":"In Training"}
