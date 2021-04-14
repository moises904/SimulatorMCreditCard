//
//  SimulatorUseCase.swift
//  Simulator
//
//  Created by Moises Almeyda on 10/04/21.
//

import Foundation
import Alamofire

protocol ISimulatorUseCase {
    func execute(completion: @escaping(Result<ParametersSimulatorResponse, AFError>)->Void)
    func execute(dataForCalculate: DataSimulatedRequest, completion: @escaping(Result<ResultSimulatedResponse, AFError>)->Void )
}


class SimulatorUseCase: ISimulatorUseCase {
    
    
    
    private let simulatorRepositoryImp: SimulatorRepository?
    
    init() {
        self.simulatorRepositoryImp = SimulatorRepository()
    }
    
    func execute(completion: @escaping (Result<ParametersSimulatorResponse, AFError>) -> Void) {
         simulatorRepositoryImp?.getDataForSimulate(completion: { result in
             completion(result)
        })
    }
    
    
    func execute(dataForCalculate: DataSimulatedRequest, completion: @escaping(Result<ResultSimulatedResponse, AFError>)->Void) {
        self.simulatorRepositoryImp?.getSimulatePayment(dataForCalculate: dataForCalculate, completion: {
            result in
            completion(result)
        })
    }
    
  
}
