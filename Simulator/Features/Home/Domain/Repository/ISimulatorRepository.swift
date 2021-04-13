//
//  SimulatorRepository.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import Foundation
import Alamofire

protocol ISimulatorRepository {
    
    func getDataForSimulate(completion:@escaping (Result<DataSimulatorResponse, AFError>)->Void)
    func getSimulatePayment()
    
}
