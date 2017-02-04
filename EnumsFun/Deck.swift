//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards: [Card] = []
    
    init() {
        for rank in Rank.ranks {
            for suit in Suit.suits {
                let card = Card(rank: rank, suit: suit)
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }
}


