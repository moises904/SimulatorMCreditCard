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
    func loadResult(resultSimulator: ResultSimulatedResponse) {
        goToResultSimulate(resultSimulator: resultSimulator)

    }
    
    
    func loadData(data: ParametersSimulatorResponse) {
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
        calculateSimulation()
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
    
    func calculateSimulation() {
        let documentNumber = documentNumberTextField.text
        let descriptionCard = typeCardsDropDown.text
        let amountForSimulate = amountTextField.text
        let currentTea = numberTeaDropDown.text
        let numbreQuote = quoteToFinanceDropDown.text
        let numberDay = paymentDayDropDown.text
        let dataSimulation = DataSimulatedRequest(dni:documentNumber, tarjeta:descriptionCard, monto:amountForSimulate,
                                                  cuotas:numbreQuote, tea:currentTea, dia_pago:numberDay )
        homeViewModel?.calculatePayment(dataCalculate: dataSimulation)
    }

    func goToResultSimulate(resultSimulator: ResultSimulatedResponse) {
        
        let story = UIStoryboard(name: "Result", bundle: nil)
        let resultViewController = story.instantiateViewController( identifier: "IdResultViewController") as? ResultViewController
        resultViewController?.loadDataResultSimulator(resultData: resultSimulator)
        self.navigationController?.popToViewController(self , animated: true)
        self.navigationController?.pushViewController(resultViewController!, animated: true)
    }
    
    private func loadCardData(dataSimulator: ParametersSimulatorResponse) {
        
        let currentIndex:Int = 0
        documentNumberTextField.text="23234212"
        amountTextField.text="1000"
        let creditCars = dataSimulator.responseData.tarjetas
        typeCardsDropDown.optionArray = [creditCars.nameClasica, creditCars.nameBlack, creditCars.nameGold]
        typeCardsDropDown.selectedIndex = currentIndex+1
        typeCardsDropDown.text = typeCardsDropDown.optionArray[currentIndex+1]
        
        quoteToFinanceDropDown.optionArray = dataSimulator.responseData.lstQuotes.map { String($0)  }
        quoteToFinanceDropDown.selectedIndex = currentIndex
        quoteToFinanceDropDown.text = quoteToFinanceDropDown.optionArray[currentIndex]
        
        paymentDayDropDown.optionArray = dataSimulator.responseData.paymentDays
        paymentDayDropDown.selectedIndex = currentIndex
        paymentDayDropDown.text = paymentDayDropDown.optionArray[currentIndex]
        
        numberTeaDropDown.optionArray = dataSimulator.responseData.listTeas
        numberTeaDropDown.selectedIndex = currentIndex
        numberTeaDropDown.text = numberTeaDropDown.optionArray[currentIndex]

    }
}
