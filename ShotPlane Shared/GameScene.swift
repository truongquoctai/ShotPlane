//
//  GameScene.swift
//  ShotPlane Shared
//
//  Created by Trương Quốc Tài on 04/09/2021.
//

import SpriteKit

class GameScene: SKScene {
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    override func didMove(to view: SKView) {
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
