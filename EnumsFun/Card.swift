//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit {
    case Spades, Diamonds, Hearts, Clubs
    var symbol: String {
        switch self {
        case .Spades:
            return "♠️"
        case .Diamonds:
            return "♦️"
        case .Hearts:
            return "♥️"
        case .Clubs:
            return "♣️"
        }
    }
}

enum Rank {
    case Ace, King, Queen, Jack, Ten, Nine, Eight, Seven, Six, Five, Four, Three, Two
    var value: Int {
        switch self {
        case .Ace:
            return 13
        case .King:
            return 12
        case .Queen:
            return 11
        case .Jack:
            return 10
        case .Ten:
            return 9
        case .Nine:
            return 8
        case .Eight:
            return 7
        case .Seven:
            return 6
        case .Six:
            return 5
        case .Five:
            return 4
        case .Four:
            return 3
        case .Three:
            return 2
        case .Two:
            return 1
        }
    }
}

class Card {
    let suit: Suit
    let rank: Rank

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
