//
//  SimulatorRepositoryImpl.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import Foundation
import Alamofire


class SimulatorRepository : ISimulatorRepository {
    
    
    init() {
        
    }
    
    func getDataForSimulate(completion:@escaping (Result<DataSimulatorResponse, AFError>)->Void) -> Void {
        
        ApiBuilder.generateRequest()?.responseDecodable {
            (response: AFDataResponse<DataSimulatorResponse>) in
            completion(response.result)
        }
    }
    
    func getSimulatePayment() {
        print("calculate simulate")
        
    }
    
    
}
