//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1: Player
    var player2: Player
    var deck = Deck() //instantiated with default value
    
    init(player1: String, player2: String) {
        let splitDeck = deck.split()
        let player1Hand = Hand(cards: splitDeck.0) //Creation of new Hand instance in order to pass through to the new instances of Player below
        let player2Hand = Hand(cards: splitDeck.1)
        self.player1 = Player(name: player1, hand: player1Hand) //Use of self to differentiate between the players declared above and the argument name
        self.player2 = Player(name: player2, hand: player2Hand)
    }

    func playOneTurn() -> (Player, Card?, Card?) {
        guard player1.hasCards() else { return (player2, nil, nil) } //Replaces a bunch of "if let" statements (see below for portion of initial "if let" monstrosity)
        guard player2.hasCards() else { return (player1, nil, nil) } //says, "Guard against a player having no cards. If one player has no cards, execute the 'else' statament. But if not, move on."
        
        let player1Card = player1.flip()! //Can use the ! to force unwrap because we know (through using the guard statement) that both players have cards.
        let player2Card = player2.flip()!
        
        if player1Card.rank.rawValue > player2Card.rank.rawValue {
            award(cards: [player1Card, player2Card], to: player1)
            return (player1, player1Card, player2Card)
        } else {
            award(cards: [player1Card, player2Card], to: player2)
            return (player2, player1Card, player2Card)
        }
        
    }
//    func playOneTurn() -> (Player, Card?, Card?) {
//        var winner: Player?
//        var winningTuple: (Player, Card?, Card?)
//        if let player1Card = player1.flip() {
//            if let player2Card = player2.flip() {
//                if player1Card.rank.rawValue > player2Card.rank.rawValue {
//                    winner = player1
//                    winningTuple = (winner!, player1Card, player2Card)
//                } else if player2Card.rank.rawValue > player1Card.rank.rawValue {
//                    winningTuple = (winner!, player1Card, player2Card)
//                    winner = player2
//                }
//            }
//        }
//        return winningTuple
//    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        if player1.hasCards() == false || player2.hasCards() == false {
            return true
        } else {
            return false
        }
    }
    
    
}


