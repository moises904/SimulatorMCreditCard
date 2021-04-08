//
//  HomeViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 4/04/21.
//

import UIKit
import iOSDropDown

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var documentNumberTextField: UITextField!
    @IBOutlet weak var typeCardsDropDown: DropDown!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var quoteToFinanceDropDown: DropDown!
    @IBOutlet weak var numberTeaDropDown: DropDown!
    @IBOutlet weak var paymentDayDropDown: DropDown!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        goToResultSimulate()
    }
    
    let maxCharacterDocumentNumber = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        loadDataSimulate()
        
    }
    
    private func initializeView() {
        self.navigationItem.title = "Simulador de Compras con Tarjeta"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        documentNumberTextField.delegate = self
        typeCardsDropDown.delegate = self
        
    }
    
    private func loadDataSimulate() {
        typeCardsDropDown.optionArray = ["Option 1", "Option 2", "Option 3"]
        quoteToFinanceDropDown.optionArray = ["1","2","3","4"]
        numberTeaDropDown.optionArray = ["98.00 %","45.00 %","89.90 %"]
        paymentDayDropDown.optionArray = ["1","2","3","4","5","6"]
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        let currentString: NSString = documentNumberTextField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxCharacterDocumentNumber
    }

    func goToResultSimulate() {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let resultViewController = story.instantiateViewController( identifier: "IdResultViewController")
        self.navigationController?.popToViewController(self , animated: true)
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
}
