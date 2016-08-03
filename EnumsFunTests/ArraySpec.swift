//
//  ArraySpec.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

import Foundation
import XCTest
import Quick
import Nimble
@testable import EnumsFun

class ArraySpec: QuickSpec {
    override func spec() {
        describe("Array") {
            describe ("split") {
                it("splits an array in two") {
                    let a = [1,2,3,4]
                    expect(a.count).to(equal(4))
                    let (left, right) = a.split()
                    expect(left.count).to(equal(2))
                    expect(right.count).to(equal(2))
                }
            }
        }
    }
}
