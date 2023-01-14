//
//  GenericsExercices.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 06/01/23.
//

import Foundation


class BMW: Object {}

protocol Drivable {}
protocol Stopable {}
typealias Object = Drivable & Stopable
