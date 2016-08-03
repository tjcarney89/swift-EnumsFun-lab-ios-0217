//
//  CardSpec.swift
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

class CardSpec: QuickSpec {
    override func spec() {
        describe("Card") {
            let rank = Rank(rawValue: 10)!
            let suit = Suit(rawValue: "♣️")!
            let card = Card(rank: rank, suit: suit)

            describe("initializer") {
                it("sets properties") {
                    expect(card.rank.rawValue).to(equal(10))
                    expect(card.suit.rawValue).to(equal("♣️"))
                }
            }

            describe("description") {
                it("returns a description of the card") {
                    expect(card.description).to(equal("10♣️"))
                }
            }
        }
    }
}
