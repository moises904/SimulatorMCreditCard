//
//  ApiBuilderç.swift
//  Simulator
//
//  Created by Moises Almeyda on 13/04/21.
//

import Foundation
import Alamofire

class ApiBuilder {
    
    static func makeRequest(urlPath: String, method: HTTPMethod = .get, headers: HTTPHeaders? = nil, body: [String: Any]? = nil) -> DataRequest? {
            guard let url = URL(string: urlPath), let request = try? URLRequest(url: url, method: .get) else {
                return nil
            }
            return AF.request(request)
    }
    
    static func generateRequest()->DataRequest? {
        let headers: HTTPHeaders? = [Configuration.AUTORIZATHION: Configuration.PASSWORD,
                                     Configuration.ACCEPT: Configuration.CONTECT_JSON]
        
        return AF.request(Configuration.basePathSimulator , method:.get, headers: headers)
    }
}

