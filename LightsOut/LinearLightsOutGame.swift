//
//  LinearLightsOutGame.swift
//  LightsOut
//
//  Created by Kiana Caston on 3/19/18.
//  Copyright © 2018 Kiana Caston. All rights reserved.
//

import Foundation
class LinearLightsOutGame: CustomStringConvertible {
    var numLights: Int
    var movesTaken: Int
    var gameState: String
    var lightStates: [Bool]
    
    init(numLights: Int) {
        self.gameState = "setup"
        self.numLights = numLights
        self.movesTaken = 0
        self.lightStates = [Bool](repeating: false, count: numLights)
        randomize()
    }
    
    func randomize() {
        for _ in 0..<100 {
            let randomNumber : Int = Int(arc4random_uniform(UInt32(numLights)))
            pressedLightAtIndex(randomNumber)
        }
        gameState = "play"
    }
    
    func pressedLightAtIndex(_ index: Int) -> Bool{
        if (checkWin() && gameState != "setup"){
            return true
        }

        if (index > 0) {
            lightStates[index - 1] = !lightStates[index - 1]
        }
        if (index < numLights - 1) {
            lightStates[index + 1] = !lightStates[index + 1]
        }
        lightStates[index] = !lightStates[index]
        
        if (gameState != "setup"){
            movesTaken += 1
        }
        return checkWin();
    }
    
    func checkWin() -> Bool{
        for index in lightStates {
            if (index) {
                return false
            }
        }
        return true
    }
    
    func getGameString() -> String{
        var gameString = ""
        for index in lightStates {
            if (index){
                gameString += "1"
            }
            else {
                gameString += "0"
            }
        }
        return gameString
    }
    
    var description: String {
        return "Lights: \(getGameString()) Moves: \(movesTaken)"
    }
}

