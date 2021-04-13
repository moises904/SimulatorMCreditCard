//
//  SimulatorUseCase.swift
//  Simulator
//
//  Created by Moises Almeyda on 10/04/21.
//

import Foundation
import Alamofire

protocol ISimulatorUseCase {
    func execute(completion: @escaping(Result<DataSimulatorResponse, AFError>)->Void) }


class SimulatorUseCase: ISimulatorUseCase {
    
    private let simulatorRepositoryImp: SimulatorRepository?
    
    init() {
        self.simulatorRepositoryImp = SimulatorRepository()
    }
    
    func execute(completion: @escaping (Result<DataSimulatorResponse, AFError>) -> Void) {
         simulatorRepositoryImp?.getDataForSimulate(completion: { result in
             completion(result)
        })
    }
    
    
  
    
  
}
