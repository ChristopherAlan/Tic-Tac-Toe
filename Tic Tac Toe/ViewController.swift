//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Christopher Alan on 12/6/14.
//  Copyright (c) 2014 2x2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var goNumber = 1
    var winner = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,] // 0 = empty, 1 = circle, 2 = cross
    
    // FYI game grid starts at 0
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet var button0: UIButton!
    @IBOutlet var label: UILabel!
    
    @IBOutlet var playAgain: UIButton!
    @IBAction func playAgainPressed(sender: AnyObject) {
        
        goNumber = 1
        winner = 0
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
        
        var button : UIButton
        for var i = 0; i < 9; i++ {
            
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        
        }
        
        playAgain.alpha = 0
        label.alpha = 0
        label.text = ""
        
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && winner == 0) {
        // winner prevents the game from playing after theres a winner 
            
        var image = UIImage()
        
        if (goNumber%2 == 0) {
            image = UIImage(named: "cross.png")!
            gameState[sender.tag] = 2
            
        } else {
            image = UIImage(named: "circle.png")!
            gameState[sender.tag] = 1
        }
            
            for combination in winningCombinations { // loop through the array 
                
                if (gameState[combination[0]]==gameState[combination[1]] && gameState[combination[1]]==gameState[combination[2]] && gameState[combination[0]] != 0) {
                    // last check prevents false positives since the game starts at 0
                    
                    winner = gameState[combination[0]]
                    
                }
            
            }
            
            if (winner != 0) {
                
                if (winner == 1) {
                
                    label.text = "Circles have won!"
                    label.alpha = 1
                    label.backgroundColor = UIColor(red: 0.925, green: 0.310, blue: 0.224, alpha: 1.000)
                    
                } else {
                
                    label.text = "Crosses have won!"
                    label.alpha = 1
                    label.backgroundColor = UIColor(red: 0.196, green: 0.659, blue: 0.906, alpha: 1.000)
                }
                
                UIView.animateWithDuration(0.4, animations: {
                    
                    self.playAgain.alpha = 1
                    
                })
            }
                
            else if (goNumber > 8) {
                    
                label.text = "Tie Game!"
                label.alpha = 1
                UIView.animateWithDuration(0.4, animations: {
                    
                    self.playAgain.alpha = 1
                    
                })
                    
            }
                
            
        
        goNumber++
        sender.setImage(image, forState: .Normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        playAgain.alpha = 0
        label.alpha = 0
        
    }

    

}

