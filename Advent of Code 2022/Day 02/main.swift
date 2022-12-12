//
//  main.swift
//  Day 02
//
//  Created by Bence Tóth on 2022. 12. 12..
//

import Foundation

var input: [[Shape]] {
    let res = Utils.openResource(day: "02")
    return res.components(separatedBy: "\n").map {
        $0.components(separatedBy: " ").map {
            Shape.init(rawValue: $0)!
        }
    }
}

var result1 = 0
var result2 = 0

enum Shape: String {
    case rock = "A"
    case paper = "B"
    case scissor = "C"
    
    init?(rawValue: String) {
        switch (rawValue) {
        case "A", "X":
            self = .rock
        case "B", "Y":
            self = .paper
        case "C", "Z":
            self = .scissor
        default:
            return nil
        }
    }
}

func getResult(opponent: Shape, you: Shape) -> Int {
    switch (opponent, you) {
    case (.rock, .rock): return 3
    case (.rock, .paper): return 6
    case (.rock, .scissor): return 0
        
    case (.paper, .rock): return 0
    case (.paper, .paper): return 3
    case (.paper, .scissor): return 6
        
    case (.scissor, .rock): return 6
    case (.scissor, .paper): return 0
    case (.scissor, .scissor): return 3
    }
}

func getResultFor(shape: Shape) -> Int {
    switch shape {
    case .rock:
        return 1
    case .paper:
        return 2
    case .scissor:
        return 3
    }
}

func getShapeFor(opponent: Shape, result: Shape) -> Int {
    switch (opponent, result) {
    case (.rock, .rock): return 0 + getResultFor(shape: .scissor)
    case (.rock, .paper): return 3 + getResultFor(shape: .rock)
    case (.rock, .scissor): return 6 + getResultFor(shape: .paper)
        
    case (.paper, .rock): return 0 + getResultFor(shape: .rock)
    case (.paper, .paper): return 3 + getResultFor(shape: .paper)
    case (.paper, .scissor): return 6 + getResultFor(shape: .scissor)
        
    case (.scissor, .rock): return 0 + getResultFor(shape: .paper)
    case (.scissor, .paper): return 3 + getResultFor(shape: .scissor)
    case (.scissor, .scissor): return 6 + getResultFor(shape: .rock)
    }
}

for game in input {
    result1 += getResult(opponent: game[0], you: game[1])
    result1 += getResultFor(shape: game[1])
    result2 += getShapeFor(opponent: game[0], result: game[1])
}

print(result1)
print(result2)
