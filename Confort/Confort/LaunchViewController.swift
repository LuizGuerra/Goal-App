//
//  LaunchViewController.swift
//  Confort
//
//  Created by Lucas Iankowski Corrêa da Silva on 15/05/19.
//  Copyright © 2019 ADABestGroup. All rights reserved.
//

import UIKit

import MediaPlayer

import AVKit

class LaunchViewController: UIViewController {
    
    fileprivate var rootViewController: UIViewController? = nil
    
    var player: AVPlayer?
    
    var playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        showSplashViewController()
        
        
        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    func playVideo() {
        
        let videoURL = NSURL(string: "MobileApplication")
        
        player = AVPlayer(url: videoURL! as URL)
        
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        
        self.addChild(playerController)
        
        
        
        // Add your view Frame
        
        playerController.view.frame = self.view.frame
        
        
        
        // Add subview in your view
        
        self.view.addSubview(playerController.view)
        
        
        
        player?.play()
        
    }
    
    private func loadVideo() {
        
        
        
        //this line is important to prevent background music stop
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
            
        } catch { }
        
        
        
        let path = Bundle.main.path(forResource: "MobileApplication", ofType:"mp4")
        
        
        
        let filePathURL = NSURL.fileURL(withPath: path!)
        
        let player = AVPlayer(url: filePathURL)
        
        let playerLayer = AVPlayerLayer(player: player)
        
        
        
        playerLayer.frame = self.view.frame
        
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        playerLayer.zPosition = -1
        
        
        
        self.view.layer.addSublayer(playerLayer)
        
        
        
        
        
        player.seek(to: CMTime.zero)
        
        player.play()
        
    }
    
    
    
    func showSplashViewControllerNoPing() {
        
        
        
        if rootViewController is LaunchViewController {
            
            return
            
        }
        
        
        
        loadVideo()
        
    }
    
    
    
    /// Simulates an API handshake success and transitions to MapViewController
    
    func showSplashViewController() {
        
        showSplashViewControllerNoPing()
        
        
        
        delay(6.00) {
            
            self.showMenuNavigationViewController()
            
        }
        
    }
    
    
    
    public func delay(_ delay:Double, closure:@escaping ()->()) {
        
        DispatchQueue.main.asyncAfter(
            
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
        
    }
    
    
    
    /// Displays the MapViewController
    
    func showMenuNavigationViewController() {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
//        let nav =  storyboard.instantiateViewController(withIdentifier: "homeTab")
        
//        nav.willMove(toParent: self)
        performSegue(withIdentifier: "homeTab", sender: nil)
        
//        addChild(nav)
        
//        if let rootViewController = self.rootViewController {
//            
//            self.rootViewController = nav
//            
//            rootViewController.willMove(toParent: nil)
//            
//            
//            
//            transition(from: rootViewController, to: nav, duration: 0.55, options: [.transitionCrossDissolve, .curveEaseOut], animations: { () -> Void in
//                
//                
//                
//            }, completion: { _ in
//                
//                nav.didMove(toParent: self)
//                
//                rootViewController.removeFromParent()
//                
//                rootViewController.didMove(toParent: nil)
//                
//            })
//            
//        } else {
//            
//            rootViewController = nav
//            
//            view.addSubview(nav.view)
//            
//            nav.didMove(toParent: self)
//            
//        }
        
        
        
        
        
    }
    
    
    
    override var prefersStatusBarHidden : Bool {
        
        switch rootViewController  {
            
        case is LaunchViewController:
            
            return true

        default:
            
            return false
            
        }
        
    }
    
    
    
}
