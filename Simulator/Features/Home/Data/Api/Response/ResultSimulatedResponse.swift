//
//  ResultSimulatedResponse.swift
//  Simulator
//
//  Created by Moises Almeyda on 13/04/21.
//

import Foundation

struct ResultSimulatedResponse: Decodable {
    
    let code:Int
    let response:ResultSimulator
    
    private enum CodingKeys: String, CodingKey {
        case code
        case response
    }
    
    
    struct ResultSimulator: Decodable {
        let quotes: String
        let money: String
        let firstQuote: String
        let state:String
        
        private enum CodingKeys: String, CodingKey {
            case quotes = "cuota"
            case money = "moneda"
            case firstQuote = "primeraCuota"
            case state = "estado"
        }
    }
}
