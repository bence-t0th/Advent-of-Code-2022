//
//  Utils.swift
//  Day 01
//
//  Created by Bence Tóth on 2022. 12. 01..
//

import Foundation

class Utils {
    static func openResource(day: String, test: Bool = false) -> String {
        let path = "/Users/bencetoth/Documents/Advent-of-Code-2022/Advent of Code 2022/Day \(day)/\(day)\(test ? "test" : "").txt"
        do {
            return try String(contentsOfFile: path, encoding: .utf8)
        }
        catch let error {
            return ("Ooops! Something went wrong: \(error)")
        }
    }
}
