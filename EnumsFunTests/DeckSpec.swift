//
//  DeckSpec.swift
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

class DeckSpec: QuickSpec {
    override func spec() {
        describe("Deck") {
            let deck = Deck()
            describe("initializer") {
                it("creates an array of 52 cards") {
                    expect(deck.cards.count).to(equal(52))
                }
            }

            describe("split") {
                it("splits a deck into two hands") {
                    let (left, right) = deck.split()
                    expect(left.count).to(equal(26))
                    expect(right.count).to(equal(26))
                }
            }
        }
    }
}
