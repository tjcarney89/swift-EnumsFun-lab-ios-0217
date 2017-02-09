//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    let warGame = GameEngine(player1: "John McClane", player2: "Hans Gruber")
    
    var john: Player {
        return warGame.player1
    }
    var hans: Player {
        return warGame.player2
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, johnCard, hansCard) = warGame.playOneTurn()
        
        if let johnCard = johnCard {
            playerCardLabel.text = johnCard.description
        }
        if let hansCard = hansCard {
            opponentCardLabel.text = hansCard.description
        }
        
        winnerLabel.text = "\(winner.name) wins!"
        
        playerScoreLabel.text = "John: \(john.hand.size)"
        opponentScoreLabel.text = "Hans: \(hans.hand.size)"
        
        if warGame.gameOver() == false {
            gameOverLabel.isHidden = true
        } else {
            gameOverLabel.text = "GAME OVER!"
            flipCardButton.isHidden = true
        }
    }
    
   
    
}
