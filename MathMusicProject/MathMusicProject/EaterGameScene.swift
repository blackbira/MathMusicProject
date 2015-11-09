//
//  EaterGameScene.swift
//  MathMusicProject
//
//  Created by Bira on 25/08/15.
//  Copyright (c) 2015 Bebip. All rights reserved.
//


/*
OBSERVACOES:

Devido ao trabalho estar senfo feito com a Escala em AspectFit sera considereado
para as margens laterias 150 pixels para cada lado, tornando o campo utilizado
entre as dimensoes de -150 ate 2198

*/

import SpriteKit
import AVFoundation

class EaterGameScene: SKScene {
    
    //BOTOES
    var back = SKSpriteNode()
    var backgroundEaterGame = SKSpriteNode()
    
    //NOTAS
//    var colcheia = SKTexture (imageNamed: "colcheia.png")
    
    //IDENTIFICADOR DOS OBJETOS CRIADOS
    var id = 0
    
    //LIMITES DA TELA
    let limitXNegative:CGFloat = -150
    let limitXPositive:CGFloat = 2198
    let limitYNegative:CGFloat = 0
    let limitYPositive:CGFloat = 1536
    
    
    //TIMER
    var timer: NSTimer = NSTimer()
    var timeNote = 0;
    
    //TEMPORARIO
    var countTimeNoteLabel: SKLabelNode = SKLabelNode()
    

    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        //INICIA O CONTADOR DOS TIMER
        startTimer()
        
        //CONSTROI A CENA
        createObjectsInScene()
        
//        //DEFINE E PREAPARA AS ANIMACOES PARA O TAMANDUA
//        definesAnimalAnimationsAndCreateActions()
//        
//        //CRIA AS ACTIONS DA ESTEIRA E ITENS
//        createActions()
//        
//        //INICIALIZA TEMPO DO JOGO
//        startTimer()

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        
        
//        print("Toque: X(\(touchLocation.x) e Y:(\(touchLocation.y)))")
        
        
        
        
        
        
        //Botao que volta para o menu
        if back.containsPoint(touchLocation){
            let menuScene = MenuScene.unarchiveFromFile("MenuScene") as! MenuScene
            menuScene.scaleMode = SKSceneScaleMode.AspectFit
            view!.presentScene(menuScene)
        }
        
    }
    
    //EXECUTA A CADA 1 SEGUNDO (Atraves da chamada do startTimer)
    func countTimeToCreationANote(){
        if timeNote > 1{
            timeNote = 0
            countTimeNoteLabel.text = String(timeNote)
            removeOldNote()
            createNote()
            
        }else{
            timeNote++
            countTimeNoteLabel.text = String(timeNote)
//            println("\(countTimeNoteLabel.text)")
        }
    }
    
    //EXECUTA A CONTAGEM DOS TIMER
    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countTimeToCreationANote"), userInfo: nil, repeats: true)
        
    }
    
    //CONFIGURA E POSICIONA OS ELEMENTOS NA CENA
    func createObjectsInScene(){
    
        //ELEMENTOS DA HUD
        back = childNodeWithName("back") as! SKSpriteNode
        countTimeNoteLabel = childNodeWithName("countTimeNoteLabel") as! SKLabelNode
        backgroundEaterGame = childNodeWithName("backgroundEaterGame") as! SKSpriteNode
        
        
    }
    
    //CRIA E POSICIONA A NOTA RANDOMICAMENTE NA TELA
    func createNote(){
        
        //Determina a posicao de criacao das notas
        let randPosX = arc4random_uniform(UInt32(backgroundEaterGame.frame.width))
        let randPosY = arc4random_uniform(UInt32(backgroundEaterGame.frame.height))
        
        //Determina qual nota sera criada
        
        //Adiciona a nota na cena
        let newNote = SKSpriteNode (imageNamed: "colcheia.png")
        newNote.zPosition = 1
        newNote.position = CGPointMake(CGFloat(randPosX), CGFloat(randPosY))
        newNote.name = String(id)
        id++
        
        //Corrige a posicao de criacao da nota no eixo X
        //Correcao para X negativo
        var fixedXNegative = newNote.position.x - newNote.frame.width/2
        if fixedXNegative < limitXNegative{
            fixedXNegative -= limitXNegative
            newNote.position.x -= fixedXNegative
        }
        
        //Correcao para X positivo
        var fixedXPositive = newNote.position.x + newNote.frame.width/2
        if fixedXPositive > limitXPositive{
            fixedXPositive -= limitXPositive
            newNote.position.x -= fixedXPositive
        }
        
        //Corrige a posicao de criacao da nota no eixo Y
        //Correcao para Y negativo
        var fixedYNegative = newNote.position.y - newNote.frame.height/2
        if fixedYNegative < limitYNegative{
            fixedYNegative -= limitYNegative
            newNote.position.y -= fixedYNegative
        }
        
        //Correcao para Y positivo
        var fixedYPositive = newNote.position.y + newNote.frame.height/2
        if fixedYPositive > limitYPositive{
            fixedYPositive -= limitYPositive
            newNote.position.y -= fixedYPositive
        }
        
        addChild(newNote)
    }
    
    //REMOVE A NOTA ANTIGA
    func removeOldNote(){
        for note in self.children{
            if note.name == String(id-1){
                note.removeFromParent()
                return
            }
        }
    }
}