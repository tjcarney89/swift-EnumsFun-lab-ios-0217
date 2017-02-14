//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var opponentPlayedLabel: UILabel!
    @IBOutlet weak var playerPlayedLabel: UILabel!
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var opponentTie1: UILabel!
    @IBOutlet weak var opponentTie2: UILabel!
    @IBOutlet weak var opponentTie3: UILabel!
    @IBOutlet weak var playerTie1: UILabel!
    @IBOutlet weak var playerTie2: UILabel!
    @IBOutlet weak var playerTie3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opponentPlayedLabel.text = "Hans Played:"
        playerPlayedLabel.text = "John Played:"
        opponentCardLabel.isHidden = true
        playerCardLabel.isHidden = true
        winnerLabel.isHidden = true
        opponentTie1.isHidden = true
        opponentTie2.isHidden = true
        opponentTie3.isHidden = true
        playerTie1.isHidden = true
        playerTie2.isHidden = true
        playerTie3.isHidden = true
    }
    
    let warGame = GameEngine(player1: "John McClane", player2: "Hans Gruber")
    
    var john: Player {
        return warGame.player1
    }
    var hans: Player {
        return warGame.player2
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, johnCard, hansCard) = warGame.playOneTurn()
        opponentTie1.isHidden = true
        opponentTie2.isHidden = true
        opponentTie3.isHidden = true
        playerTie1.isHidden = true
        playerTie2.isHidden = true
        playerTie3.isHidden = true
        
        if let johnCard = johnCard {
            playerCardLabel.isHidden = false
            playerCardLabel.text = johnCard.description
            winnerLabel.isHidden = false
            winnerLabel.text = "\(winner.name) wins!"
        }
        if let hansCard = hansCard {
            opponentCardLabel.isHidden = false
            opponentCardLabel.text = hansCard.description
            winnerLabel.isHidden = false
            winnerLabel.text = "\(winner.name) wins!"
        }
        
        
        if johnCard?.rank == hansCard?.rank {
            let (tieWinner, johnCard, hansCard, johnTie1, johnTie2, johnTie3, hansTie1, hansTie2, hansTie3) = warGame.tieBreaker()
            opponentTie1.isHidden = false
            opponentTie2.isHidden = false
            opponentTie3.isHidden = false
            playerTie1.isHidden = false
            playerTie2.isHidden = false
            playerTie3.isHidden = false
            if let hansTie1 = hansTie1, let hansTie2 = hansTie2, let hansTie3 = hansTie3, let johnTie1 = johnTie1, let johnTie2 = johnTie2, let johnTie3 = johnTie3, let tieWinner = tieWinner {
                opponentTie1.text = hansTie1.description
                opponentTie2.text = hansTie2.description
                opponentTie3.text = hansTie3.description
                playerTie1.text = johnTie1.description
                playerTie2.text = johnTie2.description
                playerTie3.text = johnTie3.description
                winnerLabel.isHidden = false
                winnerLabel.text = "\(tieWinner.name) wins!"
                print("\(tieWinner.name), John: \(johnTie3.description), Hans: \(hansTie3.description)")
            }
        }
        
        
        
        playerScoreLabel.text = "John: \(john.hand.size)"
        opponentScoreLabel.text = "Hans: \(hans.hand.size)"
        
        if warGame.gameOver() == false {
            gameOverLabel.isHidden = true
        } else {
            gameOverLabel.isHidden = false
            gameOverLabel.text = "GAME OVER!"
            flipCardButton.isHidden = true
        }
    }
    
   
    
}
