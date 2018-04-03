//
//  ViewController.swift
//  LightsOut
//
//  Created by Kiana Caston on 3/18/18.
//  Copyright © 2018 Kiana Caston. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lightButtons: [UIButton]!
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    var game = LinearLightsOutGame(numLights: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
        updateView()
    }


    @IBAction func pressedNewGame(_ sender: Any) {
        game = LinearLightsOutGame(numLights: 13)
        updateView()
    }
    
    @IBAction func lightButtonPressed(_ sender: Any) {
        let lightButton = sender as! UIButton
        game?.pressedLight(at: lightButton.tag)
        updateView()
    }
    
    func updateView() {
        let on = #imageLiteral(resourceName: "light_on")
        let off = #imageLiteral(resourceName: "light_off")
        let numLights:Int = (game?.numLights)!
        let movesTaken:Int = (game?.movesTaken)!
    
//        print(game?.checkWin())
    
        // iPhone
        if (traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact) {
            gameStateLabel.text = String(format: "Moves: %d", movesTaken)
        } else {
            gameStateNavBar.topItem?.title = String(format: "Moves: %d", movesTaken)
        }
        
        for i in 0..<numLights{
            let button = lightButtons[i]
            if (game?.isLightOn(at: i))! {
                button.setBackgroundImage(on, for: UIControlState.normal)
            } else {
                button.setBackgroundImage(off, for: UIControlState.normal)
            }
        }
    }
}

