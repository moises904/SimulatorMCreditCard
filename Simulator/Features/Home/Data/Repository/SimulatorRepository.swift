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
    
    func getDataForSimulate(completion:@escaping (Result<ParametersSimulatorResponse, AFError>)->Void) -> Void {
        
        ApiBuilder.generateRequest(valueMethod: HTTPMethod.get)?.responseDecodable {
            (response: AFDataResponse<ParametersSimulatorResponse>) in
            completion(response.result)
        }
    }
    func getSimulatePayment(dataForCalculate: DataSimulatedRequest?,
                            completion: @escaping(Result<ResultSimulatedResponse, AFError>)->Void) {
        print("calculate simulate")
        ApiBuilder.generateRequest(request: dataForCalculate, valueMethod: HTTPMethod.post)?.responseDecodable {
            (response: AFDataResponse<ResultSimulatedResponse>) in

            completion(response.result)
        }
    }
    
    
}
