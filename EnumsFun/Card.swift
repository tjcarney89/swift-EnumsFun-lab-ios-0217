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
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace

    var stringValue: String {
        switch self {
        case .Ace:
            return "A"
        case .King:
            return "K"
        case .Queen:
            return "Q"
        case .Jack:
            return "J"
        default:
            return "\(rawValue)"
        }
    }
}

class Card {
    let suit: Suit
    let rank: Rank
    var description: String {
        return "\(rank.stringValue)\(suit.rawValue)"
    }

    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
