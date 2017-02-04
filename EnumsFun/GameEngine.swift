//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    
    let player1: Player
    let player2: Player
    let deck = Deck()
    
    init(player1: String, player2: String) {
        let splitDeck = deck.split()
        let player1Hand = Hand(cards: splitDeck.0)
        let player2Hand = Hand(cards: splitDeck.1)
        self.player1 = Player(name: player1, hand: player1Hand)
        self.player2 = Player(name: player2, hand: player2Hand)
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        guard player1.hasCards() else { return (player2, nil, nil) }
        guard player2.hasCards() else { return (player1, nil, nil) }
        
        let player1Card = player1.flip()!
        let player2Card = player2.flip()!
        
        if player1Card.rank.rawValue > player2Card.rank.rawValue {
            award(cards: [player1Card, player2Card], to: player1)
            return (player1, player1Card, player2Card)
        } else {
            award(cards: [player1Card, player2Card], to: player2)
            return (player2, player1Card, player2Card)
        }
        
    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
    
    
}


