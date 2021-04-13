//
//  ApiResponseBase.swift
//  Simulator
//
//  Created by Moises Almeyda on 8/04/21.
//

import Foundation

struct DataSimulatorResponse : Decodable {
    
    let codeResponse: Int
    let responseData: BodyResponse
    
    private enum CodingKeys: String, CodingKey {
        case codeResponse = "code"
        case responseData = "response"
    }
    
    
    struct BodyResponse: Decodable {
        let tarjetas: Tarjetas
    }
    
    struct Tarjetas: Decodable {
        
        let nameClasica: String
        let nameGold: String
        let nameBlack: String
        private enum CodingKeys: String, CodingKey {
            case nameClasica = "clasica"
            case nameGold = "oro"
            case nameBlack = "black"
        }
    }
    
    
    func getDataSimulatorModel() -> DataSimulatorModel {
        
        let cards = Cards(classic: self.responseData.tarjetas.nameClasica,gold: self.responseData.tarjetas.nameGold,
                          black: self.responseData.tarjetas.nameBlack)
        return DataSimulatorModel(cards: cards)
        
    }
}
