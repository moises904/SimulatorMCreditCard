//
//  ResultViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var titleResultLabel: UILabel!
    @IBOutlet weak var amountResultLabel: UILabel!
    @IBOutlet weak var firstDatePaymentLabel: UILabel!
    private var resultSimulator: ResultSimulatedResponse?

    
    @IBAction func clickReturSimulate(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        self.navigationItem.title = "Simulador de Compras con Tarjeta"
        showResultSimulate()
    }
    
    func loadDataResultSimulator(resultData: ResultSimulatedResponse) {
        self.resultSimulator = resultData
    }
    
    func showResultSimulate() {
        let symbolCurrency:String? =  self.resultSimulator?.response.money
        let amount:String? = self.resultSimulator?.response.quotes
        
        let amountWithCurrency = "\(symbolCurrency!) \(amount!)"
        self.amountResultLabel.text = amountWithCurrency
        let firstDay =   "Fecha primera cuota:" + (self.resultSimulator?.response.firstQuote)!
        firstDatePaymentLabel.text = firstDay
    }
        
}
