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
        
        ApiBuilder.generateSimpleRequest()?.responseDecodable {
            (response: AFDataResponse<ParametersSimulatorResponse>) in
            completion(response.result)
        }
    }
    func getSimulatePayment(dataForCalculate: DataSimulatedRequest,
                            completion: @escaping(Result<ResultSimulatedResponse, AFError>)->Void) {
        print("calculate simulate")
        debugPrint(dataForCalculate)
        ApiBuilder.generateRequest(request: dataForCalculate)?.responseDecodable {
            (response: AFDataResponse<ResultSimulatedResponse>) in
        
            completion(response.result)
        }
    }
    
    
}
