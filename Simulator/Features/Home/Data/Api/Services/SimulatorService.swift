//
//  SimulatorService.swift
//  Simulator
//
//  Created by Moises Almeyda on 9/04/21.
//

import Foundation
import Alamofire

enum LoadUserError: Error, Equatable {
    case invalidUserId
    case invalidBundleUrl
    case failToMakeDataOrDecodeUserData
}

protocol SimulatorService {
    func getParametersSimulator(completionHandler: @escaping (Result<DataSimulatorResponse, ApiError>) -> Void)
    func getParametersSimulator2(completion:@escaping (Result<DataSimulatorResponse, AFError>)->Void)
}

class SimulatorServiceImp : SimulatorService {

    
    
    func getParametersSimulator2(completion:@escaping (Result<DataSimulatorResponse, AFError>)->Void) {
            
        let headers: HTTPHeaders = ["Authorization": "BEARER abdnhzodkjyxjmcazs5tgxzfer5ij00pe9ho6g1h",
                                    "Accept": "application/json"]
        
        AF.request(Configuration.basePathSimulator , method:.get, headers: headers).responseDecodable {
            (response: AFDataResponse<DataSimulatorResponse>) in

            completion(response.result)
        }
    }
    
    
    public init() {
        
    }
    
    
    func getParametersSimulator(completionHandler: @escaping (Result<DataSimulatorResponse,ApiError>) -> Void) {
        
        let headers: HTTPHeaders = ["Authorization": "BEARER abdnhzodkjyxjmcazs5tgxzfer5ij00pe9ho6g1h",
                                    "Accept": "application/json"]
        
        AF.request(Configuration.basePathSimulator , method:.get, headers: headers)
            .validate()
            .responseDecodable { (response: AFDataResponse<DataSimulatorResponse>) in
                print("************************************+*+")
                print(response)
                switch response.result {
                case .success(let userDatas):
                    completionHandler(.success(userDatas))
                case .failure(let error):
                    //let apiError = ApiError.init(code: "400", message: "sadsdadsa")
                    //completionHandler(.failure(apiError))
                    print("erorrrrr")
                    print(error)
                }
                
        }
        

    }
    
    
}
