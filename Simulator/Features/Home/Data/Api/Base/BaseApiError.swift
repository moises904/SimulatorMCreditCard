//
//  BaseApiError.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import Foundation

struct ApiError: Error, Decodable {
    let code: String
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }
}
