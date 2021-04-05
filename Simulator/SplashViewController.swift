//
//  ViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 28/03/21.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    
    @IBOutlet weak var animationViewSplash: AnimationView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Splash...."
        self.navigationController?.isNavigationBarHidden = true
        
        
        animationViewSplash.contentMode = .scaleAspectFit
        animationViewSplash.loopMode = .loop
        animationViewSplash.animationSpeed = 0.5
        animationViewSplash.play()
    
        var gameTimer: Timer?
        
        gameTimer = Timer.scheduledTimer(timeInterval: 3, target: self,
                                         selector: #selector(goToHome), userInfo: nil, repeats: false)
    }
    
    @objc func goToHome() {
        print("al home")

        let story = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = story.instantiateViewController( identifier: "IdHomeViewController")
        let splashViewController = story.instantiateViewController(identifier: "IdSplashViewController")
        self.navigationController?.popToViewController(self , animated: true)

        self.navigationController?.pushViewController(homeViewController, animated: true)
    }


}

