//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var hand: Hand
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    
    func hasCards() -> Bool {
        if hand.cards.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    func flip() -> Card? {
        if hasCards() == true {
            let flippedCard = hand.cards.removeFirst()
            return flippedCard
        } else {
            return nil
        }
    }
    
    func give(card: Card) {
        hand.cards.append(card)
    }
    
    func lose(card: Card) {
        hand.cards.removeFirst()
    }

 
}

