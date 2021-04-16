//
//  ErrorResponse.swift
//  Simulator
//
//  Created by Moises Almeyda on 14/04/21.
//

import Foundation
import Alamofire

struct ErrorResponse : Error, Decodable{
    
    let codeError:String
    let messageError: String
    
    private enum CondingKeys: String, CodingKey {
        case codeError = "code"
        case messageError = "mensaje"
    }
}
