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
        
        let headers: HTTPHeaders = [Configuration.AUTORIZATHION: Configuration.PASSWORD,
                                    Configuration.ACCEPT: Configuration.CONTECT_JSON]
        
        AF.request(Configuration.basePathSimulator , method:.get, headers: headers).responseDecodable {
            (response: AFDataResponse<DataSimulatorResponse>) in
            completion(response.result)
        }
        
    }
    
    func getSimulatePayment() {
        print("calculate simulate")

    }
    
    
}
