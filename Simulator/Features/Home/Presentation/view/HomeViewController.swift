//
//  HomeViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 4/04/21.
//

import UIKit
import iOSDropDown
import Alamofire

final class HomeViewController: UIViewController, UITextFieldDelegate, StoryboardInstantiable {
    
    
    @IBOutlet weak var documentNumberTextField: UITextField!
    @IBOutlet weak var typeCardsDropDown: DropDown!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var quoteToFinanceDropDown: DropDown!
    @IBOutlet weak var numberTeaDropDown: DropDown!
    @IBOutlet weak var paymentDayDropDown: DropDown!
    @IBOutlet weak var calculateButton: UIButton!
    
    private var homeViewModel : HomeViewModel?
    
    @IBAction func clickCalculate(_ sender: UIButton) {
        goToResultSimulate()
    }
    
    let maxCharacterDocumentNumber = 8
    
    
    static func create(with viewModel: HomeViewModel) -> HomeViewController {
        let view = HomeViewController.instantiateViewController()
        view.homeViewModel = viewModel
        return view
    }
    
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
        homeViewModel = HomeViewModel ()
        homeViewModel?.getDataForLoadSimulator()
    }
    
    private func loadDataSimulate() {
        typeCardsDropDown.optionArray = ["Option 1", "Option 2", "Option 3"]
        quoteToFinanceDropDown.optionArray = ["1","2","3","4"]
        numberTeaDropDown.optionArray = ["98.00 %","45.00 %","89.90 %"]
        paymentDayDropDown.optionArray = ["1","2","3","4","5","6"]
        /*
        let headers: HTTPHeaders = [
            "Authorization": "BEARER abdnhzodkjyxjmcazs5tgxzfer5ij00pe9ho6g1h",
            "Accept": "application/json"
        ]
         AF.request("http://35.192.80.171/bootcamp/wp-json/bcp/simulator", method:.get, headers: headers).response {
            response in debugPrint(response)
        }*/
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        

        
        let currentString: NSString = documentNumberTextField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxCharacterDocumentNumber
    }

    func goToResultSimulate() {
        
        let story = UIStoryboard(name: "Result", bundle: nil)
        let resultViewController = story.instantiateViewController( identifier: "IdResultViewController")
        self.navigationController?.popToViewController(self , animated: true)
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
}
