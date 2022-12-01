//
//  main.swift
//  Advent of Code 2022
//
//  Created by Bence Tóth on 2022. 11. 30..
//

import Foundation

var input: [[Int]] {
    let res = Utils.openResource(day: "01")
    return res.components(separatedBy: "\n\n").map {
        $0.components(separatedBy: "\n").map {
            Int($0) ?? -1
        }
    }
}

print(input.map { $0.reduce(0, +) }.max() ?? -1)

print(input.map { $0.reduce(0, +) }.sorted().suffix(3).reduce(0, +))
