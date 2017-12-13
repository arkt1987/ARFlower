//
//  ViewController.swift
//  ARkit Ghost
//
//  Created by Suraj B on 12/13/17.
//  Copyright © 2017 CZSM. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        
//        SPRITE NODE: An SKSpriteNode is a node that draws a texture (optionally blended with a color), an image, a colored square. You can also provide a custom shader to create your own rendering effects.
        
        let node = SKSpriteNode(imageNamed: "image")
        
        let arrayOfColors = [UIColor.red, UIColor.magenta, UIColor.blue, UIColor.cyan, UIColor.blue, UIColor.gray, UIColor.green, UIColor.white]
        
        let randomColor = arc4random() % UInt32(arrayOfColors.count)
        
        node.color = arrayOfColors[Int(randomColor)]
        node.colorBlendFactor = 1
        
        return node;
        
        
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
