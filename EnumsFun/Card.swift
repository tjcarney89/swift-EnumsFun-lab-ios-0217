//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    
    static let allSuits: [Suit] = [.spade, .club, .heart, .diamond]
    case spade = "♠️"
    case club = "♣️"
    case heart = "♥️"
    case diamond = "♦️"
    

}

enum Rank: Int {
    
    static let allRanks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
    
    case two = 2
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
    var stringValue: String {
        var valueOfRank: String = ""
        if self.rawValue == 11 {
            valueOfRank = "J"
        } else if self.rawValue == 12 {
            valueOfRank = "Q"
        } else if self.rawValue == 13 {
            valueOfRank = "K"
        } else if self.rawValue == 14 {
            valueOfRank = "A"
        } else {
            valueOfRank = "\(self.rawValue)"
        }
        return valueOfRank
    }
    
 
}

class Card: Equatable { //Equatabe protocal let's us compare certain elements
    var suit: Suit
    var rank: Rank
    var description: String {
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    
    init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool { //This promises to run a function
        return lhs.description == rhs.description
    }

    
}


