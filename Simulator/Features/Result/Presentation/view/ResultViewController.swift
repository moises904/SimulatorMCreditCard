//
//  ResultViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var resultSimulator: ResultSimulatedResponse?
    
    @IBAction func clickReturSimulate(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        self.navigationItem.title = "Simulador de Compras con Tarjeta"
        
    }
    
    func loadDataResultSimulator(resultData: ResultSimulatedResponse) {
        self.resultSimulator = resultData
        print(resultSimulator?.response.firstQuote)
    }
}
