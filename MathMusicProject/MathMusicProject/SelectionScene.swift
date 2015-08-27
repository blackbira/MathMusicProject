//
//  SelectionScene.swift
//  MathMusicProject
//
//  Created by Bira on 27/08/15.
//  Copyright (c) 2015 Bebip. All rights reserved.
//

import SpriteKit
import AVFoundation

class SelectionScene: SKScene {
    
    var back: SKSpriteNode = SKSpriteNode()
    var attackGame: SKSpriteNode = SKSpriteNode()
    
    
    
    
    var musicOn: SKSpriteNode = SKSpriteNode()
    var soundOn: SKSpriteNode = SKSpriteNode()
    var colorBlindOn: SKSpriteNode = SKSpriteNode()
    
    var soundGame: Bool = Bool()
    var musicGame: Bool = Bool()
    var colorBlind: Bool = Bool()
    var daltonicoMode: Bool = Bool()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var audioPlayer = AVAudioPlayer()
    
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        
        back = childNodeWithName("back") as! SKSpriteNode
        attackGame = childNodeWithName("attackGame") as! SKSpriteNode
        
        
        //        //        defaults.setBool(true, forKey: "musicLoaded")
        //
        //        var back = childNodeWithName("back") as! SKSpriteNode
        //
        //        musicOn = childNodeWithName("musicOn") as! SKSpriteNode
        //        soundOn = childNodeWithName("soundOn") as! SKSpriteNode
        //        colorBlindOn = childNodeWithName("modeColorBlindOn") as! SKSpriteNode
        //
        //        musicGame = defaults.boolForKey("musicGame")
        //        soundGame = defaults.boolForKey("soundGame")
        //        daltonicoMode = defaults.boolForKey("daltonicoMode")
        //
        //        colorBlind = defaults.boolForKey("colorBlind")
        //
        //        //DEFINE MUSICA
        //        if musicGame{
        //            musicOn.alpha = 1
        //        }else{
        //            musicOn.alpha = 0
        //        }
        //
        //        //DEFINE SOM
        //        if soundGame{
        //            soundOn.alpha = 1
        //        }else{
        //            soundOn.alpha = 0
        //        }
        //
        //        //DEFINE MODO DALTONICO
        //        if colorBlind{
        //            colorBlindOn.alpha = 1
        //        }else{
        //            colorBlindOn.alpha = 0
        //        }
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        var touch = touches.first as! UITouch
        var touchLocation = touch.locationInNode(self)
        
        
        if back.containsPoint(touchLocation){
            var menuScene = MenuScene.unarchiveFromFile("MenuScene") as! MenuScene
            view!.presentScene(menuScene)
        }
        
        if attackGame.containsPoint(touchLocation){
            var attackGame = AttackGameScene.unarchiveFromFile("AttackGameScene") as! AttackGameScene
            view!.presentScene(attackGame)
        }
        
        
        //        if self.childNodeWithName("musicOn")!.containsPoint(touchLocation){
        //            if musicGame {
        //                AudioNode!.playSound(RummyAudio.SoundsEnum.SelectConfig)
        //                musicOn.alpha = 0
        //                musicGame = false
        //                defaults.setObject(false, forKey: "musicGame")
        //
        //                AudioNode?.stopMusic()
        //                MusicSetUp = musicGame
        //
        //
        //
        //            }else{
        //                AudioNode!.playSound(RummyAudio.SoundsEnum.SelectConfig)
        //                musicOn.alpha = 1
        //                musicGame = true
        //                defaults.setObject(true, forKey: "musicGame")
        //
        //                MusicSetUp = musicGame
        //                AudioNode!.playMusic(RummyAudio.MusicsEnum.Title)
        //
        //            }
        //            defaults.synchronize()
        //        }
        //
        //        if self.childNodeWithName("soundOn")!.containsPoint(touchLocation){
        //            if soundGame {
        //                soundOn.alpha = 0
        //                soundGame = false
        //                defaults.setObject(false, forKey: "soundGame")
        //
        //                AudioNode!.playSound(RummyAudio.SoundsEnum.SelectConfig)
        //                AudioSetUp = soundGame
        //
        //            }else{
        //                soundOn.alpha = 1
        //                soundGame = true
        //                defaults.setObject(true, forKey: "soundGame")
        //
        //                AudioSetUp = soundGame
        //                AudioNode!.playSound(RummyAudio.SoundsEnum.SelectConfig)
        //            }
        //            defaults.synchronize()
        //        }
        //
        //
        //        if self.childNodeWithName("modeColorBlindOn")!.containsPoint(touchLocation){
        //            if !colorBlind {
        //                AudioNode!.playSound(RummyAudio.SoundsEnum.SelectConfig)
        //                colorBlindOn.alpha = 1
        //                colorBlind = true
        //                defaults.setObject(colorBlind, forKey: "colorBlind")
        //                daltonicoMode = true
        //                defaults.setObject(true, forKey: "daltonicoMode")
        //            }else{
        //                AudioNode!.playSound(RummyAudio.SoundsEnum.SelectConfig)
        //                colorBlindOn.alpha = -1
        //                colorBlind = false
        //                defaults.setObject(colorBlind, forKey: "colorBlind")
        //                daltonicoMode = false
        //                defaults.setObject(false, forKey: "daltonicoMode")
        //            }
        //            defaults.synchronize()
        //        }
        //        
        //        if self.childNodeWithName("back")!.containsPoint(touchLocation){
        //            var menuScene = MenuScene.unarchiveFromFile("MenuScene") as! MenuScene
        //            AudioNode!.playSound(RummyAudio.SoundsEnum.SelectButton)
        //            view!.presentScene(menuScene)
        //        }
        
    }
    
}