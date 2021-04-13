//
//  HomeViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 4/04/21.
//

import UIKit
import iOSDropDown
import Alamofire

final class HomeViewController: UIViewController, UITextFieldDelegate, StoryboardInstantiable, LoadDataSimulator {
    
    func loadData(data: DataSimulatorResponse) {
        loadCardData(dataSimulator: data)
    }
    
    func loadError(aferror: AFError) {
        //<#code#>
    }
    
    
    
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
        
    }
    
    private func initializeView() {
        
        self.navigationItem.title = "Simulador de Compras con Tarjeta"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        documentNumberTextField.delegate = self
        typeCardsDropDown.delegate = self
        homeViewModel = HomeViewModel (loadDataSimulator: self)
        homeViewModel?.getDataForLoadSimulator()
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
    
    private func loadCardData(dataSimulator: DataSimulatorResponse) {
     
        let creditCars = dataSimulator.responseData.tarjetas
        typeCardsDropDown.optionArray = [creditCars.nameClasica, creditCars.nameBlack, creditCars.nameGold]
        quoteToFinanceDropDown.optionArray = dataSimulator.responseData.lstQuotes.map { String($0)  }
        paymentDayDropDown.optionArray = dataSimulator.responseData.paymentDays
        numberTeaDropDown.optionArray = dataSimulator.responseData.listTeas

    }
}
