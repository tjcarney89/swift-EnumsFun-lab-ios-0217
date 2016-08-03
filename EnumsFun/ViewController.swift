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

    var gameEngine: GameEngine!
    var you: Player {
        return gameEngine.player2
    }
    var opponent: Player {
        return gameEngine.player1
    }

    override func viewDidLoad() {
        gameEngine = GameEngine(player1: "Opponent", player2: "You")
        updateScores()
    }

    func updateGameOver() {
        if gameEngine.gameOver() {
            flipCardButton.enabled = false
        }
    }

    func updateScores() {
        playerScoreLabel.text = "You: \(you.hand.size)"
        opponentScoreLabel.text = "Opponent: \(opponent.hand.size)"
    }

    @IBAction func flipCard(sender: UIButton) {
        let (winner, opponentCard, youCard) = gameEngine.playOneTurn()

        if winner.name == "You" {
            winnerLabel.text = "You win!"
        } else {
            winnerLabel.text = "Opponent wins!"
        }

        if let youCard = youCard {
            playerCardLabel.text = youCard.description
        }

        if let opponentCard = opponentCard {
            opponentCardLabel.text = opponentCard.description
        }

        updateScores()
        updateGameOver()
    }
}
