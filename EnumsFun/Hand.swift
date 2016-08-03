//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card]
    var size: Int {
        return cards.count
    }

    init(cards: [Card]) {
        self.cards = cards
    }

    func flip() -> Card? {
        guard size > 0 else { return nil }
        return cards.removeAtIndex(0)
    }

    func giveCard(card: Card) {
        cards.append(card)
    }

    func loseCard(card: Card) {
        cards.removeAtIndex(0)
    }
}
