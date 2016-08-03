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
