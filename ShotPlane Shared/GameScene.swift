//
//  GameScene.swift
//  ShotPlane Shared
//
//  Created by Trương Quốc Tài on 04/09/2021.
//

import SpriteKit

class GameScene: SKScene {

    var player = Player()
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
        self.setUpScene()
    }
    
    override func update(_ currentTime: TimeInterval) {
        moveBG()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        player.run(.move(to: location, duration: 0.1))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        player.position = location
    }
    
    func setUpScene() {
        self.backgroundColor = .white
        setupBG()
        setupPlayer()
        createEnemy()
        spawnEnemies()
    }
    
    // MARK: - Background
    func setupBG() {
        for i in 0 ... 2 {
            let bg = SKSpriteNode(imageNamed: "background")
            bg.size = CGSize(width: self.size.width, height: self.size.height)
            bg.name = "BG"
            bg.zPosition = -1
            self.addChild(bg)
            bg.position = CGPoint(x: 0, y: CGFloat(i) * bg.frame.height)
       }
    }
    
    func moveBG() {
        enumerateChildNodes(withName: "BG") { (node, _) in
            guard let node = node as? SKSpriteNode else { return }
            
            node.position.y -= 4.5
            if node.position.y < -self.frame.height {
                node.position.y += self.frame.height * 2.0
            }
        }
    }
    
    // MARK: - Player + Bullet
    func setupPlayer() {
        self.addChild(player)
        player.position = CGPoint(x: 0, y: -self.frame.height * 0.4)
        run(.repeatForever(.sequence([
            .wait(forDuration: 0.4),
            .run({ [weak self] in
                self?.createBullet()
            })
        ])))
    }
    
    func createBullet() {
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.position = player.position
        bullet.setScale(0.2)
        addChild(bullet)
        
        let moveBy = SKAction.moveTo(y: frame.height/2, duration: 1)
        bullet.run(.repeatForever(.sequence([moveBy, .removeFromParent()])))
    }
    
    
    // MARK: - Enemies
    
    func createEnemy() {
        let enemy: Enemy
        let duration: CGFloat
        
        switch Int(arc4random() % 100) {
        case 0 ... 75:
            enemy = Enemy.createSmallEnemy()
            duration = CGFloat(Float(arc4random() % 3 + 2))
        case 75 ... 97:
            enemy = Enemy.createMediumEnemy()
            duration = CGFloat(Float(arc4random() % 3 + 4))
        default:
            enemy = Enemy.createLangeEnemy()
            duration = CGFloat(Float(arc4random() % 3 + 6))
        }
        enemy.health = enemy.type.rawValue
        addChild(enemy)
        let randomX = CGFloat.random(min: -frame.width/2 + 50, max: frame.width/2 - 50)
        enemy.position = CGPoint(x: randomX, y: frame.height / 2)
        
        let moveTo = SKAction.moveTo(y: -frame.height / 2, duration: TimeInterval(duration))
        enemy.run(.repeatForever(.sequence([moveTo, .removeFromParent()])))
    }
    
    func spawnEnemies() {
        run(.repeatForever(.sequence([
            .wait(forDuration: 1.0),
            .run({ [weak self] in
                self?.createEnemy()
            })
        ])))
    }
}
