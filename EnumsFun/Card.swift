//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"
}

enum Rank: Int {
    case One = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, King, Queen, Ace
}

class Card {
    let suit: Suit
    let rank: Rank
    var description: String {
        return "\(rank.rawValue)\(suit.rawValue)"
    }

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
