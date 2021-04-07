//
//  HomeViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 4/04/21.
//

import UIKit
import iOSDropDown

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var documentNumberTextField: UITextField!
    @IBOutlet weak var typeCardsDropDown: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Simulador de Compras con Tarjeta"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        
        typeCardsDropDown.optionArray = ["Option 1", "Option 2", "Option 3"]
        
    }
}
