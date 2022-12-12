//
//  main.swift
//  Day 04
//
//  Created by Bence Tóth on 2022. 12. 12..
//

import Foundation

var input: [[[Int]]] {
    let res = Utils.openResource(day: "04")
    return res.components(separatedBy: "\n").map {
        $0.components(separatedBy: ",").map { part in
            part.components(separatedBy: "-").map { n in
                Int(n)!
            }
        }
    }
}

var result = 0
var result2 = 0

for pair in input {
    if (pair[0][0] <= pair[1][0] && pair[0][1] >= pair[1][1]) ||
        (pair[0][0] >= pair[1][0] && pair[0][1] <= pair[1][1]) {
        result += 1
    }
}

for pair in input {
    if (pair[0][1] < pair[1][0]) || (pair[0][0] > pair[1][1]) {
        print(pair)
        result2 += 1
    }
}

print(result)
print(input.count - result2)
