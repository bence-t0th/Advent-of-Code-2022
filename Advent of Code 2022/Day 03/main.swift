//
//  main.swift
//  Day 03
//
//  Created by Bence Tóth on 2022. 12. 12..
//

import Foundation

var input: [[String]] {
    let res = Utils.openResource(day: "03")
    return res.components(separatedBy: "\n").map {
        return [String($0[0..<$0.count / 2]), String($0[$0.count / 2...$0.count])]
    }
}

var input2: [String] {
    let res = Utils.openResource(day: "03")
    return res.components(separatedBy: "\n")
}

var result = 0
var result2 = 0

func getValue(common: String) -> Int {
    let a = UnicodeScalar("a").value
    let z = UnicodeScalar("z").value
    let common = UnicodeScalar(common)!.value
    
    if (a...z).contains(common) {
        return Int(common - 96)
    } else {
        return Int(common - 38)
    }
}

for rucksack in input {
    if let common = Set(rucksack[0]).intersection(Set(rucksack[1])).first {
        result += getValue(common: String(common))
    }
}

for elves in stride(from: 0, to: input2.count - 1, by: 3) {
    let elf1 = input2[elves]
    let elf2 = input2[elves + 1]
    let elf3 = input2[elves + 2]
    if let common = Set(elf1).intersection(Set(elf2)).intersection(Set(elf3)).first {
        result2 += getValue(common: String(common))
    }
}

print(result)
print(result2)
