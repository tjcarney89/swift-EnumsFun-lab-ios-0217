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
        guard player1.hasCards else { return (player2, nil, nil) } //Replaces a bunch of "if let" statements (see below for portion of initial "if let" monstrosity)
        guard player2.hasCards else { return (player1, nil, nil) } //says, "Guard against a player having no cards. If one player has no cards, execute the 'else' statament. But if not, move on."
        
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
    
//    func tieBreak(with cards: [Card]) -> (Player, [Card]) {
//        
//        guard player1.hand.cards.count >= 3 else { return (player2, cards) }
//        guard player2.hand.cards.count >= 3 else { return (player1, cards) }
//        
//        var player1Card: Card
//        var player2Card: Card
//        
//        var copy = cards
//        
//        copy.append(player1.flip()!)
//        copy.append(player1.flip()!)
//        player1Card = player1.flip()!
//        copy.append(player1Card)
//        
//        copy.append(player2.flip()!)
//        copy.append(player2.flip()!)
//        player2Card = player2.flip()!
//        copy.append(player2Card)
//        
//
//        
//        if player1Card.rank.rawValue == player2Card.rank.rawValue {
//            return tieBreak(with: copy)
//        }
//        
//        return player1Card.rank.rawValue > player2Card.rank.rawValue ? (player1, copy) : (player2, copy)
//    }
//    
    func tieBreaker() -> (Player?, Card?, Card?, Card?, Card?, Card?, Card?, Card?, Card?) {
        
        
        
        
        let player1Card = player1.flip()!
        let player2Card = player2.flip()!
        
        
        let player1Tie1 = player1.flip()!
        let player1Tie2 = player1.flip()!
        let player1Tie3 = player1.flip()!
        let player2Tie1 = player2.flip()!
        let player2Tie2 = player2.flip()!
        let player2Tie3 = player2.flip()!
        
        if player1Tie3.rank.rawValue > player2Tie3.rank.rawValue {
            award(cards: [player1Card, player2Card, player1Tie1, player1Tie2, player1Tie3, player2Tie1, player2Tie2, player2Tie3], to: player1)
            return (player1, player1Card, player2Card, player1Tie1, player1Tie2, player1Tie3, player2Tie1, player2Tie2, player2Tie3)
        } else if player2Tie3.rank.rawValue > player1Tie3.rank.rawValue {
            award(cards: [player1Card, player2Card, player1Tie1, player1Tie2, player1Tie3, player2Tie1, player2Tie2, player2Tie3], to: player2)
            return (player2, player1Card, player2Card, player1Tie1, player1Tie2, player1Tie3, player2Tie1, player2Tie2, player2Tie3)
        } else if player1Tie3.rank.rawValue == player2Tie3.rank.rawValue {
            award(cards: [player1Card, player1Tie1, player1Tie2, player1Tie3], to: player1)
            award(cards: [player2Card, player2Tie1, player2Tie2, player2Tie3], to: player2)
            return (nil, nil, nil, nil, nil, nil, nil, nil, nil)
        } else {
            return (nil, nil, nil, nil, nil, nil, nil, nil, nil)
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
        if player1.hasCards == false || player2.hasCards == false {
            return true
        } else {
            return false
        }
    }
    
    
}


