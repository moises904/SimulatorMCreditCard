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
        animationViewSplash.contentMode = .scaleAspectFit
        animationViewSplash.loopMode = .loop
        animationViewSplash.animationSpeed = 0.5
        animationViewSplash.play()
    
    }


}

