//
//  HomeViewController.swift
//  Simulator
//
//  Created by Moises Almeyda on 4/04/21.
//

import UIKit
import iOSDropDown
import Alamofire
import NVActivityIndicatorView

final class HomeViewController: UIViewController, UITextFieldDelegate, Alertable,
                                StoryboardInstantiable, LoadDataSimulator, LoadProgress {

    
   
    var activityIndicatorView: NVActivityIndicatorView!

    
    @IBOutlet weak var documentNumberTextField: UITextField!
    @IBOutlet weak var typeCardsDropDown: DropDown!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var quoteToFinanceDropDown: DropDown!
    @IBOutlet weak var numberTeaDropDown: DropDown!
    @IBOutlet weak var paymentDayDropDown: DropDown!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBAction func dropdownBeginEdit(_ sender: Any) {
        self.view.endEditing(true)
        
    }
    
    private var homeViewModel : HomeViewModel?
    
    @IBAction func clickCalculate(_ sender: UIButton) {
    
        calculateSimulation()
    }
    
    let maxCharacterDocumentNumber = 8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        
    }
    
    private func initializeView() {
        
        self.navigationItem.title = Constants.TITLE_SCREEN_APP
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        
        initialzeProgress()

        documentNumberTextField.delegate = self
        amountTextField.delegate = self
        calculateButton.layer.cornerRadius = 10
        
        setupDropdown(genericDropDown: typeCardsDropDown)
        setupDropdown(genericDropDown: quoteToFinanceDropDown)
        setupDropdown(genericDropDown: numberTeaDropDown)
        setupDropdown(genericDropDown: paymentDayDropDown)
        
        homeViewModel = HomeViewModel (loadDataSimulator: self, loadProgress: self)
        homeViewModel?.getDataForLoadSimulator()
        
    }
    
    private func initialzeProgress() {
        
        let positionX = UIScreen.main.bounds.size.width*0.5
        let positionY = UIScreen.main.bounds.size.height*0.5
        let loaderWidth = self.view.frame.width/3
        let loaderHeigth = self.view.frame.height/3
        let frameProgress = CGRect(x: positionX - loaderWidth/2,
                                   y: positionY - loaderHeigth/2,
                                   width: loaderWidth ,
                                   height: loaderHeigth)
    
        
        activityIndicatorView = NVActivityIndicatorView(frame:  frameProgress ,
                                                          type: NVActivityIndicatorType.ballScaleRippleMultiple)
    
        activityIndicatorView.padding = 0
        activityIndicatorView.color = .red
    }
    
    private func setupDropdown(genericDropDown: DropDown) {
        genericDropDown.delegate = self
        genericDropDown.selectedRowColor = .lightGray
        genericDropDown.arrowColor = .black
        genericDropDown.borderColor = .blue
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool {
        
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxCharacterDocumentNumber
    }
    
    func calculateSimulation() {
        
       
        
        let documentNumber = documentNumberTextField.text
        let descriptionCard = typeCardsDropDown.text?.lowercased()
        let amountForSimulate = amountTextField.text
        let currentTea = numberTeaDropDown.text
        let numbreQuote = quoteToFinanceDropDown.text
        let numberDay = paymentDayDropDown.text
        
        let validate = homeViewModel?.validateFieldsForSimulator(document: documentNumber!,
                                                                amountForSimulate: amountForSimulate)
        if (validate!) {
            
        let dataSimulation = DataSimulatedRequest(dni:documentNumber, tarjeta:descriptionCard,                                                          monto:amountForSimulate,cuotas:numbreQuote, tea:currentTea,                                                     dia_pago:numberDay )
        homeViewModel?.calculatePayment(dataCalculate: dataSimulation)
            
        }
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
    
    func showActivityIndicator() {
        
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView?.startAnimating()
        
    }
    
    func hideActivityIndicator() {
        activityIndicatorView?.stopAnimating()
        self.view.willRemoveSubview(activityIndicatorView)
    }
    
    func showError(messageError: String) {
        showAlert(title:"Error", message: messageError)
    }
    
    func loadResult(resultSimulator: ResultSimulatedResponse) {
        goToResultSimulate(resultSimulator: resultSimulator)

    }
    
    
    func loadData(data: ParametersSimulatorResponse) {
        loadCardData(dataSimulator: data)
    }
    
    func loadError(aferror: AFError) {
        //<#code#>
    }
}
