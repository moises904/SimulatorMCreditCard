//
//  HomeViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 4/04/21.
//

import UIKit


class HomeViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Simulador de Compras con Tarjeta"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        
    }
}
