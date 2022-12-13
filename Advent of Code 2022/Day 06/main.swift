//
//  main.swift
//  Day 06
//
//  Created by Bence Tóth on 2022. 12. 13..
//

import Foundation

var input: String {
    let res = Utils.openResource(day: "06")
    return res
}

for i in 0..<input.count - 13 {
    var set = Set<String>()
    for j in 0...13 {
        set.insert(String(input.characterAtIndex(index: i + j)!))
    }
    if set.count == 14 {
        print(i + 14)
        break
    }
}
