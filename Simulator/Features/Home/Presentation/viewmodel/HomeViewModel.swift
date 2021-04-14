//
//  HomeViewModel.swift
//  Simulator
//
//  Created by Moises Almeyda on 10/04/21.
//

import Foundation
import Alamofire

protocol LoadDataSimulator {

    func loadData(data:ParametersSimulatorResponse)
    func loadError(aferror: AFError)
    func loadResult(resultSimulator: ResultSimulatedResponse)
    
}

final  class HomeViewModel {
        
    private var loadDataSimulator: LoadDataSimulator?
    private let simulatorUseCase: SimulatorUseCase?
    
    init(loadDataSimulator: LoadDataSimulator) {
        
        self.simulatorUseCase  = SimulatorUseCase()
        self.loadDataSimulator = loadDataSimulator
        
    }
    
    @objc func getDataForLoadSimulator() {
        
        
        let dataCompletation : (Result<ParametersSimulatorResponse,AFError>)->Void =  {
            result in
            switch result {
                case .success( let data):
                    print("viewModel success")
                    print(data)
                    self.loadDataSimulator?.loadData(data:data)
                    break
                case .failure( let error):
                    print("viewModel error")
                    self.loadDataSimulator?.loadError(aferror: error)
                    print(error)
                    break
                }
            
        }

        simulatorUseCase?.execute(completion: dataCompletation)
         
    }

    func calculatePayment(dataCalculate: DataSimulatedRequest) {
        
        let dataCompletion : (Result<ResultSimulatedResponse, AFError>)->Void = {
            result in
            
            switch result {
            case .success(let data):
                print(data)
                self.loadDataSimulator?.loadResult(resultSimulator: data)
            case .failure(let error):
               print(error)
            }
        }
        simulatorUseCase?.execute(dataForCalculate: dataCalculate, completion:dataCompletion)
    }
  
    
}
