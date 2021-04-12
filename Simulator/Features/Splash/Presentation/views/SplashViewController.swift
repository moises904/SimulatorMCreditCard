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
        let path = Bundle.main.path(forResource: "simulator_splash", ofType: "json" )
        let animation = Animation.filepath(path ?? "")
        animationViewSplash.animation = animation
        animationViewSplash.loopMode = .loop
        animationViewSplash.animationSpeed = 0.5
        animationViewSplash.play()
        
        Timer.scheduledTimer(timeInterval: 3, target: self,
                                         selector: #selector(goToHome), userInfo: nil, repeats: false)
    }
    
    @objc func goToHome() {
        let story = UIStoryboard(name: "Home", bundle: nil)
        let homeViewController = story.instantiateViewController( identifier: "IdHomeViewController")
        //self.navigationController?.popToViewController(self , animated: true)
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }



}

