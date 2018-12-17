//
//  ViewController.swift
//  mvc_7
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 tuyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardbuttons.count + 1) / 2)
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip:\(flipCount)"
        }
    }

    
    @IBOutlet var cardbuttons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBAction func touchcard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardbuttons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("choose card was not in cardButtons")
        }
    }
    func updateViewFromModel() {
        for index in cardbuttons.indices{
            let button = cardbuttons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.black : UIColor.orange
            }
        }
    }
    var emojiChoices = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵"]
    var emoji = [Int: String]()
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    func flipCard(wwithEmoji emoji:String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

