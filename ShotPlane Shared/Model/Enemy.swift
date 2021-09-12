//
//  Enemy.swift
//  ShotPlane iOS
//
//  Created by Trương Quốc Tài on 11/09/2021.
//

import SpriteKit
enum EnemySetting: Int {
    case small = 3
    case medium = 5
    case langge = 7
}

class Enemy: SKSpriteNode {
    var health: Int = 3
    var type: EnemySetting = .small
    
    class func createSmallEnemy() -> Enemy {
        let enemy = Enemy(imageNamed: "enemy1-fly")
        enemy.type = .small
        enemy.zPosition = 5.0
        enemy.setScale(0.1)
        return enemy
    }
    
    class func createMediumEnemy() -> Enemy {
        let enemy = Enemy(imageNamed: "enemy2-fly")
        enemy.type = .medium
        enemy.zPosition = 5.0
        enemy.setScale(0.2)
        return enemy
    }
    
    class func createLangeEnemy() -> Enemy {
        let enemy = Enemy(imageNamed: "enemy3-fly")
        enemy.type = .langge
        enemy.zPosition = 5.0
        enemy.setScale(0.3)
        return enemy
    }
}
