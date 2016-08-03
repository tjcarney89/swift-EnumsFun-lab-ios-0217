//
//  Array.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

extension Array {
    func split() -> ([Element], [Element]) {
        let middle = count / 2
        let left = self[0..<middle]
        let right = self[middle..<count]
        return (Array(left), Array(right))
    }
}

extension MutableCollectionType where Index == Int {
    mutating func shuffleInPlace() {
        // Borrowed from: <https://codedump.io/share/OCJt0TU9IfzE/1/how-do-i-shuffle-an-array-in-swift>
        guard count > 1 else { return }

        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
