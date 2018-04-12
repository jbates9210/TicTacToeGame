//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jared Bates on 4/9/18.
//  Copyright © 2018 jared. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winLabel: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainButton(_ sender: Any) {
        
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
                
                winLabel.isHidden = true
                playAgain.isHidden = true
                
                self.winLabel.center = CGPoint(x: self.winLabel.center.x + 500, y: self.winLabel.center.y)
                self.playAgain.center = CGPoint(x: self.playAgain.center.x + 500, y: self.playAgain.center.y)
 
            }
        }
        
    }
    // Active game
    var activeGame = true
    
    // 1 is circles, 2 is cross
    var activePlayer = 1
    
    // Array to keep track of 9 numbers for 9 pos on board. 0 -> empty, 1 -> circle, 2 -> cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    // winning state
    let winCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePos = sender.tag - 1
        
        if gameState[activePos] == 0 && activeGame {
            
            gameState[activePos] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combo in winCombos {
                if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]]{
                    activeGame = false
                    
                    winLabel.isHidden = false
                    playAgain.isHidden = false
                    
                    if gameState[combo[0]] == 1 {
                        winLabel.text = "Circles Win!"
                    } else {
                        winLabel.text = "Crosses Win!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winLabel.center = CGPoint(x: self.winLabel.center.x - 500, y: self.winLabel.center.y)
                        self.playAgain.center = CGPoint(x: self.playAgain.center.x - 500, y: self.playAgain.center.y)
                    })
                }
            
            }
            
        }
        
        print(sender.tag)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winLabel.isHidden = true
        playAgain.isHidden = true
        
        winLabel.center = CGPoint(x: winLabel.center.x + 500, y: winLabel.center.y)
        playAgain.center = CGPoint(x: playAgain.center.x + 500, y: playAgain.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

