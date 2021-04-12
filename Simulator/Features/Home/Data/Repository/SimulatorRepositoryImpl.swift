//
//  SimulatorRepositoryImpl.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import Foundation

class SimulatorRepositoryImpl : SimulatorRepository {
    
    private let simulatorServiceImp: SimulatorServiceImp?
    
    init() {
        self.simulatorServiceImp = SimulatorServiceImp()
    }
    
    func getDataForSimulate() -> Void {
        
        simulatorServiceImp?.getParametersSimulator(completionHandler:  {
            result in
        
            switch result {
            case .success(let  data):
            
                print(data.codeResponse)
            case .failure(let error):
                print(error)
            }

        })
    }
    
    func getSimulatePayment() {
        print("calculate simulate")

    }
    
    
}
