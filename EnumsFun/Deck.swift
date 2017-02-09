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
        for rank in Rank.allRanks {
            for suit in Suit.allSuits {
                let card = Card(rank: rank, suit: suit)
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        let twoHands = cards.split()
        return twoHands
    }
    
  
}

