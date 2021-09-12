//
//  Player.swift
//  ShotPlane iOS
//
//  Created by Trương Quốc Tài on 11/09/2021.
//

import SpriteKit


class Player: SKSpriteNode {
    init() {
        let texture = SKTexture(imageNamed: "player-fly")
        super.init(texture: texture, color: .clear, size: texture.size())
        zPosition = 1.0
        setScale(0.25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
