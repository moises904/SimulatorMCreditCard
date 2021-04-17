//
//  ApiBuilderç.swift
//  Simulator
//
//  Created by Moises Almeyda on 13/04/21.
//

import Foundation
import Alamofire

class ApiBuilder {
    
    static func generateRequest(request: DataSimulatedRequest? = nil, valueMethod: HTTPMethod)->DataRequest? {

        
        let headers: HTTPHeaders? = [Configuration.AUTORIZATHION: Configuration.PASSWORD,
                                     Configuration.ACCEPT: Configuration.CONTECT_JSON]
        
        let request =  AF.request(Configuration.basePathSimulator , method: valueMethod, parameters: request,
                                   encoder: URLEncodedFormParameterEncoder.default, headers:headers).validate()
        debugPrint(request)
        return request
    }
    
}

