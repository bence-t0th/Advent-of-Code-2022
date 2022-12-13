//
//  main.swift
//  Day 05
//
//  Created by Bence Tóth on 2022. 12. 13..
//

import Foundation

var input: [String] {
    let res = Utils.openResource(day: "05")
    return res.components(separatedBy: "\n\n")
}

var crates = input[0].components(separatedBy: "\n")

var numberOfStacks = crates.last?.split(separator: " ").count ?? -1

var stacks = Array(repeating: [Character](), count: numberOfStacks)

for i in stride(from: crates.count - 2, through: 0, by: -1) {
    for j in 0 ..< numberOfStacks {
        let position = j * 4 + 1
        if crates[i].characterAtIndex(index: position) != " " {
            stacks[j].append(crates[i].characterAtIndex(index: position)!)
        }
    }
}

let steps = input[1].components(separatedBy: "\n").map {
    $0.components(separatedBy: " ").compactMap {
        Int($0)
    }
}

for step in steps {
    let movable = stacks[step[1] - 1].suffix(step[0])
    stacks[step[1] - 1].removeLast(step[0])
    stacks[step[2] - 1].append(contentsOf: movable/* .reversed() */)
}

for stack in stacks {
    print(stack.last ?? "")
}
